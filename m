Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6DA3F9213
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 03:39:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BAA716D3;
	Fri, 27 Aug 2021 03:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BAA716D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630028339;
	bh=1vKVYgy+e5z1yMjqvKeoS15ybA517X1/X+2us+AnkaU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p5wt7BrrfYNc1yEwwY4VsVYkG/hSXm2Cgs8zVKAm1Bw2GlLpAZo3jWfXr51dcKhvz
	 3tunPaK+JB25NDBrWIbV+ja14hv49iiZGXmZwsQxdLl/2Hrob3iG492wj2ns5pLVaZ
	 PmMgFqiUKueEWI3gak3zIUKHUXMNy4xMUMd47YHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95D31F800EE;
	Fri, 27 Aug 2021 03:37:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC7EDF800FD; Fri, 27 Aug 2021 03:37:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.206])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02464F800FD
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 03:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02464F800FD
Received: from localhost (unknown [192.168.167.16])
 by regular1.263xmail.com (Postfix) with ESMTP id 9816C1B5B;
 Fri, 27 Aug 2021 09:37:20 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.12.19] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P702T139881362753280S1630028240323457_; 
 Fri, 27 Aug 2021 09:37:20 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <6dcc37658b0229364e9fc103e0cfe35f>
X-RL-SENDER: sugar.zhang@rock-chips.com
X-SENDER: zxg@rock-chips.com
X-LOGIN-NAME: sugar.zhang@rock-chips.com
X-FST-TO: alsa-devel@alsa-project.org
X-RCPT-COUNT: 5
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Subject: Re: [PATCH v3 05/14] ASoC: rockchip: i2s: Fix concurrency between
 tx/rx
To: Mark Brown <broonie@kernel.org>
References: <1629950441-14118-1-git-send-email-sugar.zhang@rock-chips.com>
 <1629950520-14190-5-git-send-email-sugar.zhang@rock-chips.com>
 <20210826125206.GD4148@sirena.org.uk>
From: sugar zhang <sugar.zhang@rock-chips.com>
Message-ID: <a6d7a5af-0efd-72db-b144-cf51cd0907a3@rock-chips.com>
Date: Fri, 27 Aug 2021 09:37:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210826125206.GD4148@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mark,

On 2021/8/26 20:52, Mark Brown wrote:
> On Thu, Aug 26, 2021 at 12:01:51PM +0800, Sugar Zhang wrote:
>
>> +/* tx/rx ctrl lock */
>> +static DEFINE_SPINLOCK(lock);
>> +
> Why is this a global and not part of the driver data?  It's also not
> clear to me why this is a spinlock and not a mutex.

Yes, this should be moved into driver data, will do in v4.

it's not allowed to sleep in this context, so use spinlock instead.

-- 
Best Regards!
张学广/Sugar
瑞芯微电子股份有限公司
Rockchip Electronics Co., Ltd.



