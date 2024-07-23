Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A799A93A01E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2024 13:43:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 405F1DE5;
	Tue, 23 Jul 2024 13:43:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 405F1DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721734997;
	bh=9fp/JUizxS5IqkIRscjC1V5D08luobHz0+npLcTNzR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LWVVUcLw3iVppfC2aLll5H47vnBUDXL3iUofdh7eKhjvGHmJkKbklm19QuHhiktse
	 I4nFGNKF5EN68XR0AKK/jwWwRE1sj6TudlS1zv6Y/gbGvKBcHymlnSMgD3TzmhYG6S
	 SRrJZr8MotJZqSwMc/m1dty1Cg9YQIgScJLxK+GU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02396F8059F; Tue, 23 Jul 2024 13:42:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ED8EF805AE;
	Tue, 23 Jul 2024 13:42:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27DAAF801F5; Tue, 23 Jul 2024 13:38:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51784F800C9
	for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2024 13:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51784F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=1H/C62pm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D170B60DF3;
	Tue, 23 Jul 2024 11:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1A4C4AF0A;
	Tue, 23 Jul 2024 11:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721734677;
	bh=9fp/JUizxS5IqkIRscjC1V5D08luobHz0+npLcTNzR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1H/C62pmK7q/CUr62Ib5rGt192NvwRBGHg1EgQf/EmZsCW9vFZWGRCFvMUH6i3mt5
	 9kesfOyx8TYh2pr1zhlqGEccxFaSVP/kDy3qd33eG1hh5DtAsKLK8QtDpl6P+4yPrg
	 LlETAt6y6A0eC3dUCmME3TIm8ouFrlCLvmi141u8=
Date: Tue, 23 Jul 2024 13:37:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH for-6.10 0/2] ASoC: cs35l56: Set correct upper volume
 limit
Message-ID: <2024072342-recall-dedicator-98d5@gregkh>
References: <20240722102600.37931-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722102600.37931-1-rf@opensource.cirrus.com>
Message-ID-Hash: URDZHXQ7MLPWE4JKZGQCRCORAONQWDZV
X-Message-ID-Hash: URDZHXQ7MLPWE4JKZGQCRCORAONQWDZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/URDZHXQ7MLPWE4JKZGQCRCORAONQWDZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 22, 2024 at 11:25:58AM +0100, Richard Fitzgerald wrote:
> Patch series to limit the upper range of the CS35L56 volume control to
> +12 dB.
> 
> These commits were not marked 'Fixes' because they were thought to be only
> a cosmetic issue. The user could reduce the volume to a usable value.
> 
> But for some complex audio topologies with SOF Audio DSP + CS42L43 +
> multiple CS35L56 it has turned out to be not obvious to the user what the
> problem actually is and what to do to fix it. As support for these
> topologies went into 6.10 we would like this series to be applied to 6.10.

Now queued up, thanks.

greg k-h
