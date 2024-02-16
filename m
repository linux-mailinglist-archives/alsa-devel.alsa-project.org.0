Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEFC858A28
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Feb 2024 00:31:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C8AEDF6;
	Sat, 17 Feb 2024 00:31:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C8AEDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708126285;
	bh=FMVWaPEG1nX3jE+CDbdrHVeNP4wVjb/A2lK/tKqysmw=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k1OEVlEN0NlH0tBHOumGqrB0skDwvIJIo0leyncBSZ/OW9ezHgPyt5DNulr3QEMdn
	 2Gvg+9xkQkkrUjmUHCVLEmsqx9UhCpTd9tmzH4LfeusQ0AYybMtI2ORPr5thl8MJEs
	 l+yA0QkfJ3HaN6XZ7Iczi6wGrSfUzj/arjsQh6GQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 201C2F80580; Sat, 17 Feb 2024 00:31:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9E11F8057D;
	Sat, 17 Feb 2024 00:30:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37C50F80238; Sat, 17 Feb 2024 00:30:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E231DF800EE
	for <alsa-devel@alsa-project.org>; Sat, 17 Feb 2024 00:30:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E231DF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lsI6gsEH
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1d746856d85so11940225ad.0
        for <alsa-devel@alsa-project.org>;
 Fri, 16 Feb 2024 15:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708126208; x=1708731008;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E0rm8oJW/XJYG6K14YhQ3ephozjzMlAvikt0W/eKgk8=;
        b=lsI6gsEHC8xLUr4y2o9pOPMHOW4rwz/B43qPozz4Zeq/wVL1f7FUTqBXknibPo2BBn
         TLbP2rJS3dCilBYBUVuBt+dHbYDbFIT6gxX2y7YFv4T3BywFZPUL21GJ6kAx81EFeH6V
         v93ieFxB6ZIdPAsV9oNtmA6kIA5qUPB3X3DrWVIEp2YLQVW53Gqzq2s2e/D8gCK80taE
         55wR83a7u6OswH7nlj2be4fuSXvoGw/F4dbHX2yTdSXSFA2n1ExcBNkMPXgtujxVUbHb
         JVOg6GTJA8a3aoZB21XRxF2mIh8QeQNjSbmtf8TrVrlgqOUUsMAvMkyVrHmGafbg5cOx
         TMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708126208; x=1708731008;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E0rm8oJW/XJYG6K14YhQ3ephozjzMlAvikt0W/eKgk8=;
        b=tHkT+47jUK4DAnpDetUHvPCMqUmmSokYYaqxXwNYAuy7tQwALNmm2aUZ4rFDhwbHZk
         YcxecU/id0RFha8w8VDwND40OcRWvki0GZCwOIR+OcrggrJ5MWkvxm2+cpT3BV8odQk8
         voBHMMU92zNv2A4paBzoXJqOPpB/pwf/0RI0E2UkScFww5cbtXRXhQ54q9nMc88EhjRO
         HKRxIWl8YnQLdgh10ghcObBt+pGSMEXyUHA58O/ilq2d26f6bDdF6CmBouuA57BNH8mr
         EBIMnNyboifq/npepKfjRdXXnVoHCj4qMz5CYFK6AeO6INXsaGX7gwcwJoMpFvhBABuS
         ITtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIzguaEGezjmLVdtmz5xLPtJx4mHAE8KNIcKUG/4inEYniOSocKKlhlRg/QxFRJcx7MySs6ETFTMxhKMSOnJ2lvOWv8/yj9H2OJ3A=
X-Gm-Message-State: AOJu0Yw9H3tIHXpzHHeo41y9ogTn8XgHyFlH/ZBBsRv0KuBPMs1pOQu6
	V0zKWEMS/QFfd+O59Q/V3dJPFombx8F1OZNlay2pLJXHuLV7h3/s6qQA3/9fNX0OOJgAnGSDxlq
	kjBoX+x8s0x3j65g24Yf1dw98lNQ=
X-Google-Smtp-Source: 
 AGHT+IG8NGWNkQaKqUI/eMg10+AC0G35IgZ/oydeFaacpUBCAryssRpS62z0cOhEkKKKzCRnv4hh3ESYt2AbMmLkZIc=
X-Received: by 2002:a17:90a:ce8c:b0:299:56ee:6946 with SMTP id
 g12-20020a17090ace8c00b0029956ee6946mr165826pju.32.1708126208110; Fri, 16 Feb
 2024 15:30:08 -0800 (PST)
MIME-Version: 1.0
From: noman pouigt <variksla@gmail.com>
Date: Fri, 16 Feb 2024 15:29:56 -0800
Message-ID: 
 <CAES_P+_0tWVtn+tyUi1TvkWi4rA-ZBj8e7_pnJd1h_J3S3Cn8Q@mail.gmail.com>
Subject: Audio dsp recovery using remoteproc
To: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: N7N2EVSBXVLF5SMHPKEEVRZL5SLXHC7B
X-Message-ID-Hash: N7N2EVSBXVLF5SMHPKEEVRZL5SLXHC7B
X-MailFrom: variksla@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N7N2EVSBXVLF5SMHPKEEVRZL5SLXHC7B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

mailbox to dsp_1 is currently modeling platform pcm driver.
mailbox to dsp_2 is also doing the same.

Platform driver callbacks cause IPC to be sent to dsp's.
Lifecycle of two dsp's are managed by separate remoteproc
drivers. Single sound card is exposed.

Separate watchdog interrupts from the corresponding dsp's
are connected to remoteproc to manage crashing of the
individual dsp's. How can I restart both the dsp when either
of them crashes using the kernel device model? Remoteproc
driver currently only restarts the crashed dsp instead of restarting
both the dsp. It is needed to bring up the hardware in a consistent
state as both the dsp's are connected to a common hardware.

I thought of making a virtual parent remoteproc device
and then managing individual dsp as a subdevice of that parent device
but remoteproc device node is associated with the individual elf file i.e.
it can manage only a single dsp.

How can I model remoteproc drivers using linux device model so that when either
of them crashes both the dsp's get reloaded by the remoteproc framework.

           MailBox ---- DSP_1 ---
         |                                    |
Linux                                      ------ common_hw -> speaker/mic
          |                                    |
            MailBox ---- DSP_2 ---
