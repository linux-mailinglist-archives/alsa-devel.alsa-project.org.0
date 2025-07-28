Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41190B1395A
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jul 2025 12:56:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61CB960253;
	Mon, 28 Jul 2025 12:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61CB960253
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753700208;
	bh=101L7ZMoSdx2x9v7q29U8ZPnWqt4303aTxdUTH++2CM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IcdX+9j9R1JiHbjSoNyD+GzbaugQQawrA54SAqmKQ9+cnnL11BiFfitrV3wn6wtkm
	 ndaggIlQTsSEl11fPNqgpwU214xmyTWsGSxNlD2yw/IQPD9eBWag3esPbb5iz4cIV+
	 rRN8Ngi726/p4Fluc8tugoN9gJZ/Z0SNpsfPneXQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76FBFF805C3; Mon, 28 Jul 2025 12:56:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E91C5F805C1;
	Mon, 28 Jul 2025 12:56:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE8A1F8026A; Mon, 28 Jul 2025 12:52:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5C70F8011B
	for <alsa-devel@alsa-project.org>; Mon, 28 Jul 2025 12:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5C70F8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=VVhjyRtq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E86F75C58F5;
	Mon, 28 Jul 2025 10:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104F6C4CEF6;
	Mon, 28 Jul 2025 10:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753699964;
	bh=101L7ZMoSdx2x9v7q29U8ZPnWqt4303aTxdUTH++2CM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VVhjyRtqTgbkzAUekyOkQGQFGUg5z16o5i12+pFbCbx/0LVPHsgx7W9aGOArJEi4Q
	 EPgmiUJ57BlnIvLqez78I5LfB1HN8YgxM8EqljDSiVO29l0BFtADF8NHb2MsoehUIk
	 tki5nf+NyxOdkQispBBGxM5nVLYnQqZDMmOjlGi8=
Date: Mon, 28 Jul 2025 12:52:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: amd: acp: Adjust pdm dmic gain using module
 parameter
Message-ID: <2025072809-spookily-grip-3c2f@gregkh>
References: <20250728094243.3824450-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728094243.3824450-1-venkataprasad.potturu@amd.com>
Message-ID-Hash: DBINGLT65HH2IFVCORRZ6Y34QMYB6HQ7
X-Message-ID-Hash: DBINGLT65HH2IFVCORRZ6Y34QMYB6HQ7
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DBINGLT65HH2IFVCORRZ6Y34QMYB6HQ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 28, 2025 at 03:12:27PM +0530, Venkata Prasad Potturu wrote:
> Adjust pdm dimc gain value using module param.
> In case of regressions for any users that the new pdm_gain value is
> too high and for additional debugging, introduce a module parameter
> that would let them configure it.
> 
> This parameter should be removed in the future:
>  * If it's determined that the parameter is not needed, just hardcode
>    the correct value as before
>  * If users do end up using it to debug and report different values
>    we should introduce a config knob that can have policy set by ucm.

Note, you can not break a user/kernel api like this once you introduce
it, so be VERY careful (yet another reason for it to NOT be a module
parameter...)

