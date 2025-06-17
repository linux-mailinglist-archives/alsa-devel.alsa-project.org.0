Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B862ADBFA8
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jun 2025 05:20:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32788601F1;
	Tue, 17 Jun 2025 05:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32788601F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750130418;
	bh=O1ZbFWcyhgaWXEScEM9IV7fvybEJSZ4jYt2dP7Rketk=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=erHUgX+z4JREIqqrfLuLbG56SGoDgEfFMGRG346n0yTDZFD6IkA1KTtyTvhuP3O6S
	 kR0oEVZfohlGJ1R9GEhP1MOWTcAwUDoRhSeqW8VOzvAEHeob4AGcDLT7VX11TeBYj3
	 tkZosGyXM1VTDQlmdcu37ULejfbmQ75LvZqqzJ64=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 951C5F805C8; Tue, 17 Jun 2025 05:19:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CAD3F805C6;
	Tue, 17 Jun 2025 05:19:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A150F80224; Tue, 17 Jun 2025 05:19:38 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 435DBF800E4
	for <alsa-devel@alsa-project.org>; Tue, 17 Jun 2025 05:19:38 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ASoC: qcom: soundwire: Add support for controlling audio
 CGCR from
 HLOS
From: roycarlson56@gmail.com
To: alsa-devel@alsa-project.org
Date: Tue, 17 Jun 2025 03:19:38 -0000
Message-ID: 
 <175013037827.20.11883101818315195639@mailman-web.alsa-project.org>
In-Reply-To: <1646035750-25635-1-git-send-email-quic_srivasam@quicinc.com>
References: <1646035750-25635-1-git-send-email-quic_srivasam@quicinc.com>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: 36JQU2HW4LGLOC7LX4PI3ELC4HDWLQPE
X-Message-ID-Hash: 36JQU2HW4LGLOC7LX4PI3ELC4HDWLQPE
X-MailFrom: roycarlson56@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EXQUQMIH3MCCX3HOC5XPT57432M4BP6E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Slope Game is addictive in the best way. It’s quick enough to enjoy anytime, yet challenging enough to keep you coming back to sharpen your reflexes. https://slopegame.net
