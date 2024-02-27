Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E98869D11
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 18:03:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A41BB86F;
	Tue, 27 Feb 2024 18:03:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A41BB86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709053428;
	bh=l5e8ml4REQQUTX3sdXHOM7YXsSKlUkKAscSC883nVrg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HiZKSRgLR+dcn5XDqFccw6mKT6kfSQfX/D751+Hx4/ViVXAhJwzSPkKxapoDfOiyz
	 6GKTv4XDniD8rQ00piejgwTYSSf2m58FUGa/1FjV8ibRQ0zLiYn/4AeE5P4Ivu30TR
	 tdEQ3iv1OL7++Dvw82d9gsclHy7gOK+A93mniFeI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E91F7F8058C; Tue, 27 Feb 2024 18:03:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E16AF80579;
	Tue, 27 Feb 2024 18:03:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58BB5F801C0; Tue, 27 Feb 2024 18:03:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CE5CF800F0
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 18:03:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CE5CF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linutronix.de header.i=@linutronix.de
 header.a=rsa-sha256 header.s=2020 header.b=08SNpyQv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=schyaOoT
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709053387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5l/z5niNWmPcrTzUn5sccV50+EwR7ocb+Kg+fSadhTg=;
	b=08SNpyQvlIQU2jDRMfIsTN3MWypAwK0VUGYT42tEBQgFLalrgvtfjw6UYXQVej2Ynh4ktb
	5Fk4PQ1exCmD8hEkfA4vrrKFpZNWQ1AO3HA3SOinAlt+rWo2xwFY3/wZ4SgDpWCFL1WpVQ
	3Ui4gjSwZIE6e4msvl5V/U6twYA1bl7qqqwSy4rvbFeY2tm46uoYWMhDEYq394TrR6uYZl
	vyY759M+v3TaLN6BSUKcNv5ijbkpmhowBrO7U9XpbEd6b6qCRHNIBjq4sBKqSlm/CRti8t
	+xDkOUF+Kz4koFfCmAS4TKjW+HgSAGy+/eSlmUdGDeyzosfVbk/gwAEqza17pA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709053387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5l/z5niNWmPcrTzUn5sccV50+EwR7ocb+Kg+fSadhTg=;
	b=schyaOoT6pP96CHkQtz1KlTYOnuJapoTYgyTGeAbfVUt5j0qYE5viIyMTjwapWp7ij9Uiz
	Tq5mM+uFan0hgUAA==
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Charles
 Keepax <ckeepax@opensource.cirrus.com>, kernel@pengutronix.de, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, NXP Linux Team <linux-imx@nxp.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com, Fabio
 Estevam <festevam@gmail.com>, Gregory Clement
 <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 00/13] irqchip: Convert to platform remove callback
 returning void
In-Reply-To: <knhwqxhouaiehmnnz5oxaxibhq7usokefztae4pplqypwuzgye@mke2irokres4>
References: <cover.1703284359.git.u.kleine-koenig@pengutronix.de>
 <knhwqxhouaiehmnnz5oxaxibhq7usokefztae4pplqypwuzgye@mke2irokres4>
Date: Tue, 27 Feb 2024 18:03:07 +0100
Message-ID: <874jdtalh0.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HKX2ST2Q3O3WWE54XCSMAIZER7TDTR4T
X-Message-ID-Hash: HKX2ST2Q3O3WWE54XCSMAIZER7TDTR4T
X-MailFrom: tglx@linutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HKX2ST2Q3O3WWE54XCSMAIZER7TDTR4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Feb 15 2024 at 22:03, Uwe Kleine-K=C3=B6nig wrote:
> On Fri, Dec 22, 2023 at 11:50:31PM +0100, Uwe Kleine-K=C3=B6nig wrote:
>> this series converts all drivers below drivers/irqchip to use
>> .remove_new(). See commit 5c5a7680e67b ("platform: Provide a remove
>> callback that returns no value") for an extended explanation and the
>> eventual goal. The TL;DR; is to make it harder for driver authors to
>> leak resources.
>>=20
>> The drivers touched here are all fine though and don't return early in
>> .remove(). So all conversions in this series are trivial.
>
> I'm still waiting for this series to go in (or get review feedback). Is
> this still on your radar? You're the right maintainer to take this
> series, aren't you?

I am and it fell through my christmas crack. I don't even try to catch
up with email after being almost 3 weeks AFK. For two decades I rely on
submitters to ping me after a couple of weeks or month in this case :)

Thanks,

        tglx

