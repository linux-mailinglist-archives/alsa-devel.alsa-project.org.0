Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7266E6071
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 13:54:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E842E73;
	Tue, 18 Apr 2023 13:53:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E842E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681818840;
	bh=XW1W77t+hTd5dBsO7LqOvsGmGjvsBWZwm6oBjjHSRxI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U8YgH6Y5JykNqgxqnZB05mmzShDHFUUmmjCag8abRBkZVToaptsuYfgBUUiQQq0Xg
	 V/wmUd3BFkaWDdyhY4R3dVL+AufA3YpEKrlFXJuOk9PMnYqwByNLBpKiw4iytQzj02
	 RxpfsHEYgSvxXA11zTC0OPHXI37l3TzoTjFOPB+Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49F60F8052D;
	Tue, 18 Apr 2023 13:52:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31B99F80266; Mon, 17 Apr 2023 22:46:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2A45F800E2
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 22:46:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2A45F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=EPIpCONp
Received: by mail-pl1-x636.google.com with SMTP id p8so27356727plk.9
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Apr 2023 13:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764403; x=1684356403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XW1W77t+hTd5dBsO7LqOvsGmGjvsBWZwm6oBjjHSRxI=;
        b=EPIpCONpQIjyYKAFdjlI1lXx6DV9t7G+ZlhOQdxphC7zJeFZCHawOxjbnFqo6Cqz4P
         6UUGkMLShM2Tl1TWMJtEIbtOpPOQOATsWLB1c65pORCWhYQplELbToPdSEPWMSNbszMG
         8ceMbsr1r+yc4+k+RNR+dMKzxulPus6a835BWcDB+3FkWyHIuI1xoJWIP69mY8L+kJfQ
         JUgjdjzo8HJtrMIAwXDZ27FLAQM3hChGE5j1ez0BQJ33WO3HAXjIn3eVjhgaQ3c5qmpY
         HfVRua3BwnFYTUHP9AjApYD2izRy6nbeNGZjKalPI5wkxV+GaL8dh7KNZyhD2AZvzCR/
         aA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764403; x=1684356403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XW1W77t+hTd5dBsO7LqOvsGmGjvsBWZwm6oBjjHSRxI=;
        b=KQ5C9cvNji6R+CoPbdJB6fAo7AOAa1BN6NxbUWsurI7BbaVM+NTRi4B5EDmxIo1wDW
         CAbl0cnoU5apg7BwKHJ4ToL9F0nlU6UkGD02fxZfQJMshDEmGhsWuHOraxPBjFOwLBou
         My9OWmzHWzjInLR/hp2gwO0Ioo7nmSw/myXu+notmXntBtAgYVSWWCd8rpaMo/5JSDmq
         l5xzjdcGDGbnNmR9Oew5qdswbqRkX1y+hZjPYCF3TdXI3Zem0YuLwjgpmJgk/3/mCNDz
         CA3eUmhWj+ODf8Gi/Uh45lnLSYrjHPG+Vd1ZQUYkFjpksq+BFU1Js/2xcY5iEcLI+Mpx
         PpHw==
X-Gm-Message-State: AAQBX9cWEWkfv6qaewhNfdUifIYhdkghCXFQKRg6Ae0o9kmTcSF0k1QS
	NluKacDQ4OD54Atdwo1jTTM=
X-Google-Smtp-Source: 
 AKy350bRXLKLwaeRDW7sMd0ByKinn6Da0Tpa3cDSEUTgIjqC7O6aPCiDW/VU3dsCsMyaDjoJJgRuog==
X-Received: by 2002:a05:6a20:728d:b0:f0:4dbf:5f92 with SMTP id
 o13-20020a056a20728d00b000f04dbf5f92mr2315120pzk.26.1681764402424;
        Mon, 17 Apr 2023 13:46:42 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:218d:82:ae97:7cb6:b12a:54f5])
        by smtp.gmail.com with ESMTPSA id
 x14-20020a63170e000000b0050f56964426sm7198932pgl.54.2023.04.17.13.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:46:42 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org
Subject: [PATCH] ASoC: dt-bindings: wm8753: Convert to dtschema
Date: Mon, 17 Apr 2023 20:46:27 +0000
Message-Id: <20230417204627.137883-1-danascape@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <98da9a32-9771-1002-f323-909e8b49a536@linaro.org>
References: <98da9a32-9771-1002-f323-909e8b49a536@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JG3KXA6NBV3FYSLHXLTW5FAUX7NYLLMM
X-Message-ID-Hash: JG3KXA6NBV3FYSLHXLTW5FAUX7NYLLMM
X-Mailman-Approved-At: Tue, 18 Apr 2023 11:52:28 +0000
CC: alsa-devel@alsa-project.org, broonie@kernel.org, danascape@gmail.com,
 daniel.baluta@nxp.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JG3KXA6NBV3FYSLHXLTW5FAUX7NYLLMM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you for that, I will take a look and soon push the patches for bindings
that are actually being used.

Kind Regards,

Saalim
