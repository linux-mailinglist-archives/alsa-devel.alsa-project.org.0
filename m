Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD404C6261
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 06:14:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82C971719;
	Mon, 28 Feb 2022 06:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82C971719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646025263;
	bh=wD1edJGKbLYLdFJA8YOZVTIh4R8NAnjn7evAZrw7roo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cL18WLi5ngfGPEL1uUmvGS0MsfJH+R55sK9pfNG3mZwx9MlLirTOly012dswuvTRj
	 1CVcuSU7bjdxVlvFCHHUvNLblYE65EChVToEV6r13AP+UfAm4k7cbO6h6nv1ecA27V
	 3++g3WDWE79a2MW3r1vC2mgAecfhi2CJC+940qbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01701F80054;
	Mon, 28 Feb 2022 06:13:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18BACF8013C; Mon, 28 Feb 2022 06:13:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,KHOP_HELO_FCRDNS,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73DEAF80054
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 06:13:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73DEAF80054
X-QQ-mid: bizesmtp75t1646025180tolhff6f
Received: from [10.4.23.188] (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 28 Feb 2022 13:12:59 +0800 (CST)
X-QQ-SSF: 01400000002000C0F000B00A0000000
X-QQ-FEAT: FXvDfBZI5O6ME0Y4Us0w7aoT9iOXbHaKWmIC2S5WEOuI9hg6EYPFk7+8CmLGj
 mlcj5c9eeqtttDZKgS1v7YCn9GSYTfL79DxKekWIzirnq27kfSXMteJg4TxxuIGZkYrzzu+
 JK9Mjo2EmYrEaUMWnfew5wsKccsurYjpXZwNtusuYLo2JQPIQcWhwKZKSkfkVpxe8eIa0cU
 N66nmOIhRGuqGM+ThjeqjSb5Bd7H6ZkTPVATfWzcUPxYYc0M9YfuVLWxA1DD7jSUu7mfLu6
 N3LH9RLoW4AUlSc52cIUFpekX/Gj5d9qfqlMnldmLjdyuN+LB6LDRAXAY5aR+/Pq5pDuDq8
 IpL0F2Yl5MWq6GH4Fu+DG37KoR/74i0CfWGcTNzL0Nl93Qhywg=
X-QQ-GoodBg: 2
Message-ID: <56927259-87b1-cbeb-2f85-dd3a5dd67c14@uniontech.com>+8EA17305E171470B
Date: Mon, 28 Feb 2022 13:12:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v3 2/2] ALSA: core: Remove redundant variable and return
 the last statement
To: perex@perex.cz, tiwai@suse.com
References: <20220228050003.32509-1-tangmeng@uniontech.com>
 <20220228050003.32509-2-tangmeng@uniontech.com>
From: tangmeng <tangmeng@uniontech.com>
In-Reply-To: <20220228050003.32509-2-tangmeng@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
Cc: JOE Perches <joe@perches.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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



On 2022/2/28 13:00, Meng Tang wrote:
> Return the result from file->f_op->open() directly instead of
> taking this in another redundant variable. Make the typical
> return the last statement, return early and reduce the indentation
> too.
> 
> Signed-off-by: Meng Tang <tangmeng@uniontech.com>
> Signed-off-by: JOE Perches <joe@perches.com>
There is a problem with the Joe Perches signature, I have re-submit it 
in the V4 patch.

I am very sorry for the signature problem.



