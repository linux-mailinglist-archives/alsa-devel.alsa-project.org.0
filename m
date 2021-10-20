Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D3E434569
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 08:48:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7C91169B;
	Wed, 20 Oct 2021 08:47:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7C91169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634712479;
	bh=yZjRTV1/x7ZGWNldU2ATFuNUbOjFy9RUgiOseVOgqDw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oNb0GO6CKhLmHCbqxqjpVZylDa7ob36GDHCr+wA2STX/D8wqXUPIqHkX164iLtSaj
	 XGHQAbgI6HneTHd/J3li+kYHBeKQB4Ozfk2t97fh2YL0e4bP3rYTKPoikb9sv00xKU
	 +bXKFT4iK3CJImTLG9ecWJcDb1O8iB4w45zM0XVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 137D5F80082;
	Wed, 20 Oct 2021 08:46:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E286F80229; Wed, 20 Oct 2021 08:46:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.205])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60CEDF80082
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 08:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60CEDF80082
Received: from localhost (unknown [192.168.167.32])
 by regular1.263xmail.com (Postfix) with ESMTP id B56B9842;
 Wed, 20 Oct 2021 14:46:25 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.12.22] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P16835T140562797250304S1634712383778350_; 
 Wed, 20 Oct 2021 14:46:24 +0800 (CST)
X-IP-DOMAINF: 1
X-RL-SENDER: sugar.zhang@rock-chips.com
X-SENDER: zxg@rock-chips.com
X-LOGIN-NAME: sugar.zhang@rock-chips.com
X-FST-TO: jay.xu@rock-chips.com
X-RCPT-COUNT: 11
X-LOCAL-RCPT-COUNT: 1
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-UNIQUE-TAG: <0e98d8f1b9ab8a8b4cd160bf98629cb4>
X-System-Flag: 0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH=5d_ASoC=3a_rockchip=3a_use_generic_DMA_eng?=
 =?UTF-8?B?aW5lIGNvbmZpZ3VyYXRpb27jgJDor7fms6jmhI/vvIzpgq7ku7bnlLFsaW51eC1y?=
 =?UTF-8?Q?ockchip-bounces+sugar=2ezhang=3drock-chips=2ecom=40lists=2einfrad?=
 =?UTF-8?B?ZWFkLm9yZ+S7o+WPkeOAkQ==?=
To: Mark Brown <broonie@kernel.org>
References: <20211018114844.1746351-1-john@metanate.com>
 <YW1svMVSgBJygfpV@sirena.org.uk>
 <a5eebd60-da6f-cc56-b1fe-221dc827e097@rock-chips.com>
 <YW63pduAGW01PUoj@sirena.org.uk>
From: sugar zhang <sugar.zhang@rock-chips.com>
Message-ID: <cdd530bd-9d85-8edf-2151-00502bbbb4cf@rock-chips.com>
Date: Wed, 20 Oct 2021 14:46:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YW63pduAGW01PUoj@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-rockchip@lists.infradead.org,
 John Keeping <john@metanate.com>, Jianqun Xu <jay.xu@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
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

On 2021/10/19 20:18, Mark Brown wrote:
> On Tue, Oct 19, 2021 at 10:11:27AM +0800, sugar zhang wrote:
>> Hi Mark, John,
>>
>> Actually, I have submit patch[1] to do the same thing a few weeks ago, and
>> explain the original purpose.
>>
>> [1] https://x-lore.kernel.org/linux-rockchip/1632792957-80428-1-git-send-email-sugar.zhang@rock-chips.com/
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.
ok.
> Please don't top post, reply in line with needed context.  This allows
> readers to readily follow the flow of conversation and understand what
> you are talking about and also helps ensure that everything in the
> discussion is being addressed.
got it, thanks.

-- 
Best Regards!
张学广/Sugar
瑞芯微电子股份有限公司
Rockchip Electronics Co., Ltd.



