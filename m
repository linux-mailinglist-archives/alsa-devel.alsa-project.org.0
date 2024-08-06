Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8568F9495D4
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 18:44:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FA7F3CA6;
	Tue,  6 Aug 2024 18:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FA7F3CA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722962652;
	bh=I9H7A7FupsbFLzyt6LiuEeDW4TvHpRMJlvPZymABxTI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dXkU9w6QCXCX7Mj7nZjucl1IManXHx2kE9QFxrUEk6r7An9ChWiId5NM8I6RAbk48
	 EySIxTdStZavRs6hzbCeJs+78l3Sg97cYLKIknJWU+PgJ3OMx/iY5t8z4haZJELPZK
	 HHaT8EoE+KRCqzFBTUfIoHJY+ynXMeAgBmKPWvlg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 902DCF805A1; Tue,  6 Aug 2024 18:43:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBDC2F805AF;
	Tue,  6 Aug 2024 18:43:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9466EF802DB; Tue,  6 Aug 2024 18:40:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 963B4F800B0
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 18:39:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 963B4F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=L49ZGAD6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 986A461043;
	Tue,  6 Aug 2024 16:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF5EC32786;
	Tue,  6 Aug 2024 16:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722962392;
	bh=I9H7A7FupsbFLzyt6LiuEeDW4TvHpRMJlvPZymABxTI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L49ZGAD63IjjcOZfz6f+kmlxItx4dH5ZlZmPRi1pQrD4SFDcuw0rMcQykXH1HlpPX
	 LIO+dBTHM5yhS25UTAHWoIBzXC2v7/POfhHmLo3Ob0JO4fbAisiNfeeh6BpZoFwjDl
	 8aEsKq3GWz5ioLnQquf1Z6qyBtfakQD9gSeN+4oYJKZ4Y+M4nVCfujcp2TCR6zPjqq
	 lAw2PkfFOpB+bYYXHJ6gDxEiC/mrnWCTLfF0gMJno61RMJKquADdswx4rTHbiuTixk
	 Uiwly4lKczYfXmp0KXmHaEEg+fRKaWJrM3eWrFBjnbkUMlqO4N1ekG9V0zpjXI6y8+
	 AjfLwz8L9W4FQ==
Date: Tue, 6 Aug 2024 17:39:41 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: <fabrice.gasnier@foss.st.com>, Lars-Peter Clausen <lars@metafoo.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Nuno Sa <nuno.sa@analog.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 0/9] iio: adc: dfsdm: add scaling support
Message-ID: <20240806173941.074d37ee@jic23-huawei>
In-Reply-To: <20240803161334.5e627178@jic23-huawei>
References: <20240730084640.1307938-1-olivier.moysan@foss.st.com>
	<20240803161334.5e627178@jic23-huawei>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5IKOQG6A3M7F4RQBHSL2EDK3A7OWTAMJ
X-Message-ID-Hash: 5IKOQG6A3M7F4RQBHSL2EDK3A7OWTAMJ
X-MailFrom: jic23@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5IKOQG6A3M7F4RQBHSL2EDK3A7OWTAMJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 3 Aug 2024 16:13:34 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Tue, 30 Jul 2024 10:46:30 +0200
> Olivier Moysan <olivier.moysan@foss.st.com> wrote:
> 
> > The aim of this serie is to add scaling support to STM32 DFSDM
> > peripheral in the analog context.
> >   
> All looks good to me.  I'll leave it a little longer though as
> some of the dt-bindings patches don't have tags from the maintainers yet.
> 
> Jonathan
> 

Applied to the togreg branch of iio.git and pushed out as testing for 0-day
to poke at it etc.

Thanks,

Jonathan
