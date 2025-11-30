Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BBEC9521E
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Nov 2025 17:10:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4CF1601FE;
	Sun, 30 Nov 2025 17:10:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4CF1601FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764519043;
	bh=gvl0zeZiprBPYKtTv07Dt7G09FNqVbdFbP4QnhoCL3w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UqigEbfkEAE60Slp2422z74a8uA6iiS2gRn62tIkvCqLsTfMbZwLO0hsTODJWuujD
	 Iz1BDAm4yzVRAREDTv1geauvYGl8Lpy3qVGuyw+uEHOCYKH47TuxKsQ+VqTlOxebSR
	 Cy3ex+V719So2rRJOpX/ntOwXwqg7UnCZrbp53PY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9589F805BF; Sun, 30 Nov 2025 17:10:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D072CF805C2;
	Sun, 30 Nov 2025 17:10:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E002F8049C; Sun, 30 Nov 2025 17:10:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A5504F800B5
	for <alsa-devel@alsa-project.org>; Sun, 30 Nov 2025 17:10:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5504F800B5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187cd4af457b1100-webhooks-bot@alsa-project.org>
In-Reply-To: <187cd4af4560ee00-webhooks-bot@alsa-project.org>
References: <187cd4af4560ee00-webhooks-bot@alsa-project.org>
Subject: Creative ZXR channels and volume messed up
Date: Sun, 30 Nov 2025 17:10:05 +0100 (CET)
Message-ID-Hash: HFCO74TVVNOGRV3JS4L5YEEGWE7IUMYX
X-Message-ID-Hash: HFCO74TVVNOGRV3JS4L5YEEGWE7IUMYX
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFCO74TVVNOGRV3JS4L5YEEGWE7IUMYX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #484 was edited from CommonDirt:

posted this over @ Pipewire, but i'm guessing this is an ALSA issue

https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4996

something's changed with the CA0132 firmware, because previously in alsamixer the 10 band EQ was not exposed

<img width="899" height="439" alt="Image" src="https://github.com/user-attachments/assets/755ecd00-b59a-47fd-b5b0-6fa5456f3132" />

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/484
Repository URL: https://github.com/alsa-project/alsa-lib
