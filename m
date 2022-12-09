Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F306487F9
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 18:52:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 913751910;
	Fri,  9 Dec 2022 18:51:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 913751910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670608344;
	bh=fB/VNCYffmzHZxGdo7js0W5KTDDb84plw+kdg5svHiI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BTdgmyae7FVJFNoEqBjwdNTX17hOzpIIWave0zWb61o7t0qDmoFLWLpbbX6jbZ3LP
	 4+2ezF5nwZtEDYC3Xezan2Qj6JmOyavylsiVvrmZfOBb/nBR3CdRceZPY+hZIqJSjx
	 7TqQZDNUuTjEooQpR+mG7f1JLT3/7DtFCpln2+4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34057F80007;
	Fri,  9 Dec 2022 18:51:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BB05F80007; Fri,  9 Dec 2022 18:51:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E801CF80007
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 18:51:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E801CF80007
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Dvxrl5ZO
Received: by mail-yb1-xb2a.google.com with SMTP id d128so6376020ybf.10
 for <alsa-devel@alsa-project.org>; Fri, 09 Dec 2022 09:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fB/VNCYffmzHZxGdo7js0W5KTDDb84plw+kdg5svHiI=;
 b=Dvxrl5ZOSl8QHV19bowOaitVtpvtOZG3MCaawkrqS6zON7VEX2ibTONalB1BaXJDs7
 IOkOt/d1o+1vvxqrF/Is9DyNixKtprb3PVn6zFfdwkiAb75Sxx+sbDFeA3Yw2ad4518S
 7GX+eXTUIhi4LEQPDLBpr0b8AG09KQglK3hQHUmMtcMqDXE3pv3Z9sKkkYH5O+dqGQrW
 x97n73QVDO3VI89KR2fKQ9BIYtlzf/RIs6ziUTYWS0eT5KX45Wj4CKWXjXs7SbyWWUDg
 SxeUuXL4QZGWs5PKKdjB4AC/7ccpXRs5Iq8BcQx5Z5o0pxKXpeWkDYaH0KgL1HfzDs+d
 aNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fB/VNCYffmzHZxGdo7js0W5KTDDb84plw+kdg5svHiI=;
 b=BKOR7nO80yaEz6dKn/GTcspO7AkulgAEXHBd7xSLl3/R4Mbx1LFg4aeoa2VOqNddcG
 RPLiPE2zRrj4eNiJTpoQKOIluXoTYpXGmcVS1Odnyc1OTdzchcg7+pm2HvTP6S9mR2eP
 EFusveXoW2aFOTlnKqiVklOV4IZORC/gv9AXuCWQHZsHGUlgvViQyVFFdA05f+z79n+S
 jgSfeqESvxdS96rKVWF3K9JQ3+iPS3Fygl0vcu4eEdS1LmCIR+y8CKwWapG7/4YFMxbX
 Z3TVNjpX7U/59tmzHab6qi8jG/6dfO4N4YNYy7HXBbjaRs+MK5g5ooYXjLweZKbQK3P1
 480w==
X-Gm-Message-State: ANoB5pmkX3QHK/B/iVQOfEJpFaYz8r+wkvigp3oxGzRCncIyXN0w9Mq6
 /s06KSDSO6wV5XQEeEVcQzCk/hRChmRxxUudwwfuJw==
X-Google-Smtp-Source: AA0mqf5GiGSEzfbvXCkKj2ph10ZyVtLGYlWo2eaF6hnhYo7Gi6YWnfbQ4IDbJRw9BDaw6i3LiBQQXUTtRjhvNVqkYDE=
X-Received: by 2002:a25:d4d5:0:b0:70d:f50c:29ad with SMTP id
 m204-20020a25d4d5000000b0070df50c29admr2866471ybf.265.1670608281652; Fri, 09
 Dec 2022 09:51:21 -0800 (PST)
MIME-Version: 1.0
References: <20221209150503.11875-1-ajye_huang@compal.corp-partner.google.com>
 <eca17001-93ff-d379-1ab2-2927f1831e78@linux.intel.com>
 <CALprXBayJtWRe9J+q7EahgpXrRy_B-tMAf0KXbDtWa+=4RKyHA@mail.gmail.com>
 <22043956-e18c-9ed6-5091-188ae40f3cd9@linux.intel.com>
In-Reply-To: <22043956-e18c-9ed6-5091-188ae40f3cd9@linux.intel.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Sat, 10 Dec 2022 01:51:10 +0800
Message-ID: <CALprXBbxb_m_ieAi9VohZE+yUpyJ51rGE2VuskJpgNabB-gRCQ@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: Intel: sof_nau8825: add support for nau8825 with
 amp nau8318
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Libin Yang <libin.yang@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, "balamurugan . c" <balamurugan.c@intel.com>,
 Mark Brown <broonie@kernel.org>, Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, David Lin <CTLIN0@nuvoton.com>,
 alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

HI Pierre,

On Sat, Dec 10, 2022 at 1:31 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:

> Suggested edit:
>
> ASoC: Intel: sof_nau8825: add variant with nau8318 amplifier.
>

> That should be added in the commit message please.
>

Thank you for the suggestion title and I will add those explanations
in the comment message.

> Ok, makes sense now. Please do include the explanations on 8315/8318
> variants, I couldn't figure out what chips were used.
>
> I would also not use the same topology name as a different platform with
> another amplifier. I appreciate you trying to reuse when possible, but
> it's just better to create a new topology file. That way if you want any
> update down the road you can do so, it's more maintainable and risk-free.

OK, The v2 patch will be sent after the new topology file is created. Thank you.
