Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E960788C9B7
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:48:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35AB52C0A;
	Tue, 26 Mar 2024 17:48:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35AB52C0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711471706;
	bh=bqg/sFWTPVvFgqt6Vk3VOgpcqeZChiXBV3Mbug+MVEM=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BI/cpWIuHmNilE0uiWFsv01IHxookxOTh1DRkVREsK5P8AMwN9B9xSLaF2nMdYU8e
	 wpPqMti4/vW//xYeHMx25jj2x5a6filUYWVAlbN+nw9hGkfwU6RMzP3R56Xum22dTp
	 6QbL0qaRblr73NGyvL5PMrfY57voqVeHIYiQxhDk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9AB3F805AA; Tue, 26 Mar 2024 17:47:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 220DFF80236;
	Tue, 26 Mar 2024 17:47:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11562F8025F; Tue, 26 Mar 2024 17:47:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com
 [95.215.58.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE173F801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE173F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=Ko85/ACa
Date: Wed, 27 Mar 2024 03:47:06 +1100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1711471660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=bqg/sFWTPVvFgqt6Vk3VOgpcqeZChiXBV3Mbug+MVEM=;
	b=Ko85/ACaALGpuoQ2eTpzrvEirGFyjOChBId/e5tSo+K9uikkP6fmOx7Hjv4qyaOtBOEo3R
	K0l5b1/RFCOICC6IEXC518ao60zZbUR01wDUpCYc7tNCYG1AoKYYALI1onU2qcO8eJcd7j
	PTJ79Wh1/+4LV3uSwFrhKyPZWN7FMcYz0GoziUM3o41SVAF7KdQLNVPB63T8HMJ/N/j7xE
	3glt4ZSHFq2ymO8PyEZb5hPh0Ao9oMMLh4lHN8nNDhPRSh7tT+U0afPofakUCyxZU1/FjT
	YfzWefhFhc2LU+L8hTomiB2AqGbMHqS8Q71z+fjxtgmR9tg/WLeDhjD/PbdLMg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: alsa-devel@alsa-project.org
Subject: How to add jack GPIOs to audio-graph-cards?
Message-ID: <ZgL8Cr1t5aUhrClM@titan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: VWTRRKVV2KYH3JD4XOGG7NBQBGK5EWGW
X-Message-ID-Hash: VWTRRKVV2KYH3JD4XOGG7NBQBGK5EWGW
X-MailFrom: contact@jookia.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VWTRRKVV2KYH3JD4XOGG7NBQBGK5EWGW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi there,

audio-graph-card's device tree schema indicates it supports the following:

- pa-gpios
- hp-det-gpio
- mic-det-gpio

But only implements pa-gpios.

audio-graph-card2 doesn't implement any of these but will still attempts to
grab pa-gpios but never use it (possibly a bug?)

When using audio graph cards, how are you intended to add detection GPIOs?
Are there future plans to add a jacks { } section of some sort for this?

John.
