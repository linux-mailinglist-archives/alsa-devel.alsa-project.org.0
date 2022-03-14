Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DADAB4D79AE
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 04:38:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66B8F16DB;
	Mon, 14 Mar 2022 04:37:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66B8F16DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647229126;
	bh=L88JYTQK3RSTBXj7ntmxL1R1P44GB1OGBuZ1Hz9SWJI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rzzqqjp+lRbG4oejHUiNCKR9SLXeTfaZrydHFXhsvj/6p3eM5KTRLAdb/dhhAZgRJ
	 HTNdag/OrX7BC9U/Igpb1VIYc1Rma/ShpeHGY+WIsi2H/YHpGEeHlzGCdsFBlHWyWD
	 HWS07gZCl4Mnm6VUZ3j7WkvAB0/hblMy4gThb5JY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE192F801EC;
	Mon, 14 Mar 2022 04:37:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D395FF80139; Mon, 14 Mar 2022 04:37:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA556F80095
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 04:37:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA556F80095
X-QQ-mid: bizesmtp67t1647229045tcanqqio
Received: from [10.4.23.86] ( [58.240.82.166]) by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 14 Mar 2022 11:37:24 +0800 (CST)
X-QQ-SSF: 0040000000200070E000B00A0000000
X-QQ-FEAT: ALI+OuUAduwySuSoz0J/AbDOxQQT0vTvLZNbIJEQHMAOghGWxyaub7APE5GHw
 B76WsdtwKsAE4JRDibDtbFAvawvqhper4VqF3WypHMjFQbnxJ5iKJDB03FWu2QG2v4s7dEa
 u5jiytiKcLfnRm40mqq8dxc3fmb2jaiTM86YeYl8C0ny5Wmuhz5bLpKWHkbI4VoDQRynEAi
 jO4J+ru489Ru6pIuW19N0Ss5t5lNheVRTsICEc6w6ADNr5Olqf3l6vEvainvZrEZIksnO/N
 HmWlspb6W3rllZ/tRoaUK2QV88dHEIj2hNOdfjnDsFrwM/U35oMSWZXoBdAL620rEUIbh8X
 rTdlkeLFo01fxkU1pg=
X-QQ-GoodBg: 2
Message-ID: <bd07817c-9704-a223-9f0b-3c582be2c21b@uniontech.com>+03B81180ECD5C83E
Date: Mon, 14 Mar 2022 11:37:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] ASoC: Intel: boards: Use temporary variable for struct
 device
To: Mark Brown <broonie@kernel.org>
References: <20220310065354.14493-1-nizhen@uniontech.com>
 <YitRs1YveURmYtJ/@sirena.org.uk>
From: =?UTF-8?B?5YCq5oyv?= <nizhen@uniontech.com>
In-Reply-To: <YitRs1YveURmYtJ/@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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



在 2022/3/11 21:42, Mark Brown 写道:
> On Thu, Mar 10, 2022 at 02:53:54PM +0800, Zhen Ni wrote:
>> Use temporary variable for struct device to make code neater.
> 
> This doesn't apply against current code, please check and resend.

I will resend a v2 soon.



