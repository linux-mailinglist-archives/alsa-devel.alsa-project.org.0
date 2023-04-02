Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 179746D4C0A
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 17:36:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B7A4206;
	Mon,  3 Apr 2023 17:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B7A4206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680536207;
	bh=0DsL/zBRqxPzwYW1xlbJyW3fgq5H/wMYEgPOt72hbcQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ClDVj5Ev7/TkaMj1sTCHMxr17awHKy0ysHSmzwx6pJYe32fgsKvtaYToqGdvAFfiy
	 w2qXq4rGibZTqaNa+duujxMVZFxVhRGLr5/OiNVJqBoylmIAursXUIqYi6l3tj2v3+
	 1NDgFz7hhesEdgToZgfhwOJyI0UvouNHp2xucIg0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63F73F80249;
	Mon,  3 Apr 2023 17:35:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91415F8024C; Sun,  2 Apr 2023 22:25:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0ED8EF801C0
	for <alsa-devel@alsa-project.org>; Sun,  2 Apr 2023 22:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ED8EF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JJL/4gKU
Received: by mail-pj1-x1030.google.com with SMTP id
 p3-20020a17090a74c300b0023f69bc7a68so28473443pjl.4
        for <alsa-devel@alsa-project.org>;
 Sun, 02 Apr 2023 13:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680467145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DsL/zBRqxPzwYW1xlbJyW3fgq5H/wMYEgPOt72hbcQ=;
        b=JJL/4gKUlB+EDrmdGZlbC1jz+27kAyWFXYi5QE2itDS70n3dKKpBlG5+H8Zc68dOF0
         ctfaF/pXj+iAi677i+bxPEBCNwiATGOLjXQZ5f0bS5WBmt3uLh/0STx2EY3hKLsE6QfG
         wVvIubAgfSBn/xRwaBQwpOXKNhiAWvk/yhfR7SnPz5NBfO6/p4Fssiz/SDGCBkNKodFu
         QHfeGzE5VJ38VoIhteEi60M8Zx0E5LQu+vXCOvS+PF1BAYO+BLJ+5yTPTifCkIaFR2xC
         FERc+F5lNGfUyatG99e1THh9yfVJXvp4xC9IFiNGKkxOh8JMkJtQmTj5DYKxqIZRFPGl
         Bx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680467145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DsL/zBRqxPzwYW1xlbJyW3fgq5H/wMYEgPOt72hbcQ=;
        b=CnOk0HSo92AeUFL3sxUA+cCjxH2T1DOBY+O6c3whqeFYt+ZrMZXU4D+/o5LrBImjf0
         RieBBDrI8v1hrKPMh174gvci47hCIw5gZtrd4EvHUtcjAbK5KHjdY2+jlbIKj3Jk4l+w
         BBnMLOcR8x77Fg7AaF5ijGMbfe3s8By+Rpf8P1AE52gKuRSeINk1qY/U69/n488bFjXT
         8BdZLAFuG9+lAH9gppsU4y9/P+yR9pMzde26f30Y8LiL/Bxsa5Lu3sNKVuF7qnqTbcuV
         9j6XL1ccIzHFekgui7AnEy/jQgQQFa+UiWfDYTesbGYRqFmUG5bUxVANWZ8iELJCyXgu
         BxlA==
X-Gm-Message-State: AO0yUKU4OlnJYOhzJ82eopSUSpx80NdHfyQojxfUdM2j6hUONH9X7iBX
	uLaRkGuiNNUPeJGuYnb6iKo=
X-Google-Smtp-Source: 
 AK7set9XUGbrFlE96WF8zHGlheV864DgSZZVFIrFsngxHwfoI5PoH44vD2xhON661YS8gY4fORuaVg==
X-Received: by 2002:a05:6a20:c426:b0:d3:9c13:606 with SMTP id
 en38-20020a056a20c42600b000d39c130606mr27917046pzb.47.1680467144889;
        Sun, 02 Apr 2023 13:25:44 -0700 (PDT)
Received: from pavilion.. ([2409:40f2:100f:dc7:7586:11f6:6763:e4a6])
        by smtp.gmail.com with ESMTPSA id
 i17-20020aa787d1000000b00627ed4e23e0sm5402146pfo.101.2023.04.02.13.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 13:25:44 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v5] ASoC: dt-bindings: ak4458: Convert to dtschema
Date: Mon,  3 Apr 2023 01:55:37 +0530
Message-Id: <20230402202537.4373-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7554941f-0b90-5cef-48e4-eda12ef92674@linaro.org>
References: <7554941f-0b90-5cef-48e4-eda12ef92674@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: V6TR3W3HFYWYGE2E43UUVDBZJZMCZQYL
X-Message-ID-Hash: V6TR3W3HFYWYGE2E43UUVDBZJZMCZQYL
X-Mailman-Approved-At: Mon, 03 Apr 2023 15:35:52 +0000
CC: alsa-devel@alsa-project.org, broonie@kernel.org, danascape@gmail.com,
 daniel.baluta@nxp.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, shengjiu.wang@nxp.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6TR3W3HFYWYGE2E43UUVDBZJZMCZQYL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The patch has no major change, as mentioned under the changelog.
The alignment was changed according to the comment in v4

Apologies,

Saalim
