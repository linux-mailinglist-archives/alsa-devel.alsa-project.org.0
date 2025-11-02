Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6E0C290A0
	for <lists+alsa-devel@lfdr.de>; Sun, 02 Nov 2025 15:58:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C40F601B7;
	Sun,  2 Nov 2025 15:58:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C40F601B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762095532;
	bh=7VI9iwu9W+MHqn3d8bPCa0YAG4JMT8U7bn3tMW7o7r4=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=P8s+OikiNyCkBG04+2fU42wfSI6IrOyOXtkXX+iGVESEoMBMndPubuBVR+mub2xj5
	 RUFQz0xtJ6xojm7oHFywPRV382Cc/5E22aIbyBDsp0yxOQ2dXtUwgoY3DpKbqRFXuU
	 1CWLfKQW9ldJDaI3KdjoHwxAJjVGYulGH2AsV73s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E077F805C7; Sun,  2 Nov 2025 15:58:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FB3EF805C4;
	Sun,  2 Nov 2025 15:58:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0679F80424; Sun,  2 Nov 2025 15:58:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_20,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPOOFED_FREEMAIL,
	T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1BEAF8003C
	for <alsa-devel@alsa-project.org>; Sun,  2 Nov 2025 15:58:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1BEAF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.at header.i=hombre67@gmx.at header.a=rsa-sha256
 header.s=s31663417 header.b=FCz1o0Dj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.at;
	s=s31663417; t=1762095487; x=1762700287; i=hombre67@gmx.at;
	bh=7VI9iwu9W+MHqn3d8bPCa0YAG4JMT8U7bn3tMW7o7r4=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Subject:
	 Content-Type:Date:cc:content-transfer-encoding:content-type:date:
	 from:message-id:mime-version:reply-to:subject:to;
	b=FCz1o0DjxoQCq94GEnnHtkY4kda8Brw6C+X3JrJvGq1b6ItDEuoRZ89lwRaaP4Gf
	 RNkIUpyEgGVTpvTG72DRAvggTjIJ0iLL8jexe6+Xk1Bnu/D1806YMhd6sv6K8V75X
	 uWf1F2djJTDvz/et0LL1ktcUPyxNjLGWftojv2bPVdNUdkbCzeT8oR+nO4w8clBxh
	 GIyPvpTsdeuruu0yDz9r28KY9HmYcEgNIbc+TekoWQlcHTPT/vC5frukbmfq+WcIX
	 +MRzvUmMLi6Lp+z5z82R2H3FAYsnvNuCgg2TOkStoxXKo8LLf06/LpCUzjRzMeAn9
	 SKUzMsax2I85ojYiyw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [83.215.114.101] ([83.215.114.101]) by
 trinity-msg-rest-gmx-gmx-live-8648cfc795-zmn27 (via HTTP); Sun, 2 Nov 2025
 14:58:07 +0000
MIME-Version: 1.0
Message-ID: 
 <trinity-06773505-38f5-433d-a6c6-de01cad7940b-1762095486988@trinity-msg-rest-gmx-gmx-live-8648cfc795-zmn27>
From: Erwin P <hombre67@gmx.at>
To: alsa-devel@alsa-project.org
Subject: bug in snd_seq_query_subscribe_get_time_real
Content-Type: text/plain; charset=UTF-8
Date: Sun, 2 Nov 2025 14:58:07 +0000
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: 
 V03:K1:TarqVObTtUIf5G2lvNQyzL+XjcJBMna/RgbICf/Ed4z8DsbrYKwICIQiFB/xcLfMu5Kcz
 a9xKCDDe5IAmxZBmsdJkWQGhzIf6EteOuq74S+myMq4yeEFkwWNsUQebecf89I4stMllaUAW6coi
 g4QgD5rzJPHFSojyHTPwA+c4chVSSrrY98FjxMrLeKwynUNhkPgHXAhulEob6bNiCephm+S2Yhr4
 W/EnqCq/z7xYDwdsYf2qVWvCKyZs+0wxHwE4ldyp9oDLMhJMdpsB0ej7pJjkjT8+E5JkQsBUrTV2
 HiVdcBPUS5f4WiKF0wajtxBLmte+v2hVzEjFABwRcgWYHh2hwoVHB9dqMCkn84uKhVR8TIt5Lgom
 rIe/Lf4D1ea
UI-OutboundReport: notjunk:1;M01:P0:PNWaoyRB2xA=;dj/YqSA7Ow/ttIgV0FYu6quk/lU
 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
 iCsuz5LmrEaiS24z9Nf
Message-ID-Hash: RSFEI7ZNXCAVMUKS4XGQTJX7WM5OZ26K
X-Message-ID-Hash: RSFEI7ZNXCAVMUKS4XGQTJX7WM5OZ26K
X-MailFrom: hombre67@gmx.at
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RSFEI7ZNXCAVMUKS4XGQTJX7WM5OZ26K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,
I think there is a bug in snd_seq_query_subscribe_get_time_real(). This function returns (info->flags & SNDRV_SEQ_PORT_SUBS_TIMESTAMP), but it should be (info->flags & SNDRV_SEQ_PORT_SUBS_TIME_REAL), as it is in snd_seq_port_subscribe_get_time_real().
Regards, Erwin.
