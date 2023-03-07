Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A5D6AE5F1
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 17:07:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BF7614BC;
	Tue,  7 Mar 2023 17:06:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BF7614BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678205268;
	bh=XFYQawohbSYr8bhF+dM6UVdxGFOMa+fj/08Qh7g3brg=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UPoQjBwJrow8uEKsoTXmfCu0l0q24wQDcuTDjQ5+HsDuDO9Gpucmi7t7/+gXDOeKD
	 56MxnwJ93var8b6TBjSP3vIKQQljQ4pLFpw/WmBjIZmT0GhnQZYASAc3sqL3L6UM5r
	 B4pQm8C4pZdQOkoV1xl/9iaZniPpHrzjr0d2JLjk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFCD6F80236;
	Tue,  7 Mar 2023 17:06:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B70D2F8042F; Tue,  7 Mar 2023 17:06:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86845F800DF
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 17:06:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86845F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RATBaQBy
Received: by mail-ed1-x52c.google.com with SMTP id j11so34785797edq.4
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Mar 2023 08:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678205208;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o0QtJFX8gxtNTjJ6GRcfo1ZqDPziz/DQaZAItDNtjVA=;
        b=RATBaQByyM1vTgAR8CPSxwA3nz4m5X4UQtn6YetWJMv1flgi7p3hAKMD5I3y6gX+2t
         p/ZSMtgwOaAqmBRCFbLIFh6En+U52eCYXXHx3TfA22V3R4oiUV79gTB7gcfcWwdWb9Wd
         u6N4MTyNtyFbb+tn+xMmhU0PNc7LvD5TzDqls1HXhPFWejrKNNZbyTf3XD/8v3JmEmNJ
         pXrBXPdQ6V+cjBgoD3R6CQRcLWp8oThV4Blunfr/PUuN1qORsF7VJhJZamQ2bjlXLTjw
         kbVkNunLRPH/zqeTusMeB3gf4upHhhcVejN60f6FswuXuTobxKNoenacxP5xkvYcS6yp
         ML0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678205208;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0QtJFX8gxtNTjJ6GRcfo1ZqDPziz/DQaZAItDNtjVA=;
        b=OJUSfPzhMf7b20J6UlUeqCD5VKDyIh8FE1HoCaS9unP5drYVLwrrNbfNUIpNZP5jl5
         B9Ujd9tX8sGclVe2PrrXMlhg1O7WNnXtXjwZ5YkB1ztANH6K/I21Hny5VySg1y5D5im1
         vVyO8WkkP8d6tldebCQCmJ0AenHvVCk7e74q6EoP1T0phPllq6EEalP+VtVsvW5A9HAl
         G+aQLA6GLiTG2FnOWuKtCT/SUGVKzoVsY15JXpBpmoYWcN82a0rgQdBJr2Z65bOtc2B8
         LYNbOv/9nZ5VBRQ9qBa2yVjnV3Dc1WniYgjX75ZdmOmw4oXt7Zmg1LSsczSCc3U4C0Eb
         WV7Q==
X-Gm-Message-State: AO0yUKUR0Jje1GoBvs2RnNpIovtOOm5FrCQm/BDuZFcFmhLFRsRplMdt
	HYHyVFpp+igr4wVrIty0xSY=
X-Google-Smtp-Source: 
 AK7set+9XuI/AXQypsOmDsZUmZRRNOxIrcqgRrYWkGACH7MQK4UwuDUIkPfngKJebvbaoErRNkhgGw==
X-Received: by 2002:a17:906:ce46:b0:8b1:ce91:a40c with SMTP id
 se6-20020a170906ce4600b008b1ce91a40cmr13493030ejb.53.1678205208204;
        Tue, 07 Mar 2023 08:06:48 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 w22-20020a17090633d600b008b907006d5dsm6389333eja.173.2023.03.07.08.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 08:06:45 -0800 (PST)
Date: Tue, 7 Mar 2023 19:06:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: sbinding@opensource.cirrus.com
Subject: [bug report] ALSA: hda: cs35l41: Ensure firmware/tuning pairs are
 always loaded
Message-ID: <7a8aa6df-5ff0-43a6-96bd-c591da97d0cd@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 4KOJGBSAZCWKFCP4FKJFFAPHSMHDXSWG
X-Message-ID-Hash: 4KOJGBSAZCWKFCP4FKJFFAPHSMHDXSWG
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KOJGBSAZCWKFCP4FKJFFAPHSMHDXSWG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Stefan Binding,

The patch cd40dad2ca91: "ALSA: hda: cs35l41: Ensure firmware/tuning
pairs are always loaded" from Feb 13, 2023, leads to the following
Smatch static checker warning:

	sound/pci/hda/cs35l41_hda.c:303 cs35l41_request_firmware_files()
	warn: passing freed memory '*wmfw_firmware'

sound/pci/hda/cs35l41_hda.c
    291         release_firmware(*wmfw_firmware);
    292         kfree(*wmfw_filename);
                      ^^^^^^^^^^^^^^

    293 
    294         /* fallback try cirrus/part-dspN-fwtype.wmfw */
    295         ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
                                                             ^^^^^^^^^^^^^
Assume kasprintf() fails at the start of the function.  Better to set
*wmfw_firmware = NULL as the very first line of the function.

    296                                             CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "wmfw");
    297         if (!ret)
    298                 /* fallback try cirrus/part-dspN-fwtype.bin */
    299                 ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
    300                                                     CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "bin");
    301 
    302         if (ret) {
--> 303                 release_firmware(*wmfw_firmware);
                                         ^^^^^^^^^^^^^^
Use after free.

    304                 kfree(*wmfw_filename);
    305                 dev_warn(cs35l41->dev, "Unable to find firmware and tuning\n");
    306         }
    307         return ret;
    308 }

regards,
dan carpenter
