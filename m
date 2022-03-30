Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDEB4EB91F
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 05:57:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E5F816BD;
	Wed, 30 Mar 2022 05:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E5F816BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648612641;
	bh=QtGZLozjyAIOzsZSlD+JTTWigDKqQpgzm5oFEzYQXdA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dUJKbe5s4AiStLWNmEWuXLFBKBC3A/4AkvBGuPSXbleuu4gvE5n6S3evlORE/RMhH
	 jt7SL4sIDmZ6lY5PiIAQzw2yO51Qit/J/fzJhjesi3yXYFgaLo7RM2kF0334XZJEO2
	 zyqH27QaVtLKmidHb/6UbkLOvWp3N7KNgM8Us8yQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08AC7F800B8;
	Wed, 30 Mar 2022 05:56:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4399F80254; Wed, 30 Mar 2022 05:56:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66876F800B8;
 Wed, 30 Mar 2022 05:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66876F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GEKs8cX9"
Received: by mail-io1-xd2d.google.com with SMTP id b16so23463700ioz.3;
 Tue, 29 Mar 2022 20:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QtGZLozjyAIOzsZSlD+JTTWigDKqQpgzm5oFEzYQXdA=;
 b=GEKs8cX9+dTQ0wcyzXEKtdo7wsRCb/3kqRbEhVEUQhxDPvSdXhX9imKsdTQGyhq1FA
 8szamnNrvmxjU60sHdwpsyOHDOApynv4nLLMfHzvSNF5Z7s01LUvf4VlNQz9/tal+wem
 +XUtPO+t/OY4idHz16zFBukaFybQEH5UGcvN+HkmjKWgjC/ThqCRB4hp6/1EnyEuuHYR
 F8/uv5HdduVgTki8ffVbjlg0Ybl1wtiliRI4g2lxqGHWzo8wnXlrSwxJR7nhxtjvtZHo
 O8EnZujZolkKG/la9760q0AoFV5B6fvPlyrYmgGiscgwFZHP2ZzJzMUybskE7zhiuJ8R
 Qdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QtGZLozjyAIOzsZSlD+JTTWigDKqQpgzm5oFEzYQXdA=;
 b=rmesA55WcbuxQjJyCmgNUJKkREmThvQVdxGdX1NhIa21d44PGoppmtCNfuwcKxL1Yx
 tDqxqtsYig4IZkIQAJrozO+s0pjuvQtjqBM9FIlzvi5luCmlTRZvO/RIgvsOO3Q6fbOp
 6qNtlmQ3dSRUui5/FS8OAYB6Ai7lI3sNAa/tPArlCf1P3cfZ/Bo9kEmaAcUBle1ZoL1m
 dtO+Y1usC1cqTkN3h5G8Cm5MuHJLYJ2l27XSCw4srSw2nYtezebMj9dwGmk3vusCUu3/
 8s59hLoorzkL3R+Yy3DMMr4YXLSwTDrpk+n6XmzNpwZs3H/XyOXsKRYbfhXDhPZY29uJ
 qrDw==
X-Gm-Message-State: AOAM531LpOvSYUboovA6TIl4HoiM2wmOm2UaJkKVKf5S19ipiPfcnhVV
 5gyg+EjIU0jNw23rvqHMfD51drYRITb5JAm2iyQ=
X-Google-Smtp-Source: ABdhPJwMuy25sNkzJs/eXR4md0OPpU33Yss3XYjnsXRrorIW4S2a4Nc0fT/JGDbUoz1/Z60urvl9Bd+0ikuOaFsgdiQ=
X-Received: by 2002:a05:6638:2192:b0:31a:db8:8d97 with SMTP id
 s18-20020a056638219200b0031a0db88d97mr17440595jaj.201.1648612563557; Tue, 29
 Mar 2022 20:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220324084708.2009375-1-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20220324084708.2009375-1-ajye_huang@compal.corp-partner.google.com>
From: ajye huang <ajye.huang@gmail.com>
Date: Wed, 30 Mar 2022 11:55:52 +0800
Message-ID: <CACCVik86TpCVzVo6jJWNmnduk1a6_z6-Pxe3Vt6kQGRDbOa=VQ@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: Intel: sof_rt5682: Add support for max98360a
 speaker amp on SSP2
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 sound-open-firmware@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Brent Lu <brent.lu@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

The relevant modification on coreboot FW was merged on coreboot
upstream,https://review.coreboot.org/c/coreboot/+/62998.
Based on coreboot modification, the OEM string
"AUDIO-MAX98360_ALC5682I_I2S_AMP_SSP2" is correct by cmd dmidecode -t
11.

Could reviewers kindly review this Linux patch? thanks
