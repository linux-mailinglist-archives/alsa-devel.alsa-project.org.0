Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BFF5B35BD
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 12:56:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 844C5169A;
	Fri,  9 Sep 2022 12:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 844C5169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662720972;
	bh=X34RN06pM67wn+bbX7oD7FfymFohsHo20qhmxjgOpYQ=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FDdmDTsqg+vog2zHS9ZbBaVhq0hzEc3DGAMlpP1y8eM78TE4isqBpN+7xK91CSkkn
	 U0IAut8gKwyTz5mnP99YNmsVpmfqouvu2K6drbnLtzEveYXu5ZME2L9z6evZOt/ARt
	 lRqy0/zGyaP3+pHkzSO3edRIEAcIRKvLxYCXaXI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF995F8032B;
	Fri,  9 Sep 2022 12:55:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1E0BF8023A; Fri,  9 Sep 2022 12:55:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50672F8016C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 12:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50672F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KI2cVGDo"
Received: by mail-ed1-x531.google.com with SMTP id s11so1878451edd.13
 for <alsa-devel@alsa-project.org>; Fri, 09 Sep 2022 03:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=2MqAyqB3obT3a9e6Rex16DgbqUANCIruNzkxfEGRAR4=;
 b=KI2cVGDoYMuU2xHbt2FNMPUBioI6v72PhjgPblqD7QrwXyDQqtL+y5TSUwSRpuckpT
 ndgVi0Q5u1f+kwsuJnzPCp0AAzRp6zMVlU6U+qUuhm1Muitu2mtXanPcTpGdvE8Ja79r
 VL/eZU4GCaauqzTStzI/b/fEt9+Jw8hDcLLDz7Af4EwdA5USuy6WnrNVeznbv63iimRZ
 re+0RhzDxVCihZ9f0uUVGMpVBZbscaZdlZKYGtppUexQ95iQ/PlxmBPskdozaeRFqyo5
 FtdHnhJPBvsv428qviDaD9RbBY7Hgkb7D7xAhsHTqE3eNXbd3wTv9ZF/Iia4/KoHrSVS
 qQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=2MqAyqB3obT3a9e6Rex16DgbqUANCIruNzkxfEGRAR4=;
 b=txvhy8/eeCMdAl2/Dsh0nVGipwSMYtLY/cA7z+t0ylN0DyvPyPRsig7FT2QijmBUrb
 t5ta36Pm9mQ1L7yhnt4C+ihEhT5icIBrQSq7x67hin+O9rcQVg70C8GFCTMNRD2d3KjG
 CDuuZ5wNjQ/MhR+JSOhth/LhY5PFz2TXDymZEtHaFe+o8dfwk/UhcTt9o8V4dQQ2Mfsm
 6q4qud+8oKxSuKwDaSxGl+Ekwx/K1agP3nbN7ru3EY9nAgnQVLRMhdzR/fm76MSnskN9
 +idxDfv5XESTkHCEmPVRRoEjpeS0nd9Gcd+CN6PHvJO0eR41NeSYUudCVL/ERkDHi+f/
 VH2g==
X-Gm-Message-State: ACgBeo2k3svxxgDTIuiyyA6T7bO006HHYlaMQ5oJC98kQzbTDKCMMS/f
 Hkh/9gVAAtlDNjcSdFebcE0=
X-Google-Smtp-Source: AA6agR7IELyZqytBXA7cLf7FxixJI2HrWYysad8iMYuNpf5NEXQi/mkxnDMMuT3z6p/uu3LZ2RHIDw==
X-Received: by 2002:a05:6402:33c4:b0:448:e63e:4f40 with SMTP id
 a4-20020a05640233c400b00448e63e4f40mr10733719edc.203.1662720906670; 
 Fri, 09 Sep 2022 03:55:06 -0700 (PDT)
Received: from debian (host-78-150-37-98.as13285.net. [78.150.37.98])
 by smtp.gmail.com with ESMTPSA id
 7-20020a170906318700b0073100dfa7b0sm140821ejy.8.2022.09.09.03.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 03:55:06 -0700 (PDT)
Date: Fri, 9 Sep 2022 11:55:04 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, Mark Brown <broonie@kernel.org>
Subject: build failure of next-20220909 due to e9e7df88996d ("ASoC: ak4458:
 Remove component probe() and remove()")
Message-ID: <YxsbiCu80EXrVpvn@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-next@vger.kernel.org
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

Hi All,

The builds of loongarch, alpha, s390, csky and s390allmodconfig have
failed to build next-20220909 with the error:

sound/soc/codecs/ak4458.c:631:13: error: 'ak4458_reset' defined but not used [-Werror=unused-function]
  631 | static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
      |             ^~~~~~~~~~~~


git bisect pointed to e9e7df88996d ("ASoC: ak4458: Remove component probe() and remove()")

I will be happy to test any patch or provide any extra log if needed.


-- 
Regards
Sudip
