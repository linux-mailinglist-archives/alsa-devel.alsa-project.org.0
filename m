Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3983091DF27
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:27:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC26F23CE;
	Mon,  1 Jul 2024 14:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC26F23CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836835;
	bh=oL0lOl8UlorqgDe4N96CXSn6qERkQqsRkdEwKmnMLpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F2bDORLDpoyP16A0V6XOzIv1iSTMUXa6pubAz3LPS4Fe98h7tMTm0YQLEEgoU0BlV
	 q/tgtrVI849fwitELe4qKK2Sdl2Ba3FhYyJnoX/I6/ZDdU5kd+JWJ66PpDwv17aHey
	 JsMtJqgZ/C/sgbiZzKshuzLndIaaZ60S8vfHaDFs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F4CFF89785; Mon,  1 Jul 2024 14:21:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB5C9F89788;
	Mon,  1 Jul 2024 14:21:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AAA5F8023A; Fri, 21 Jun 2024 00:57:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4176EF8010C
	for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2024 00:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4176EF8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WOyKtyGi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 630F9CE1E05;
	Thu, 20 Jun 2024 22:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B798C2BD10;
	Thu, 20 Jun 2024 22:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718924245;
	bh=oL0lOl8UlorqgDe4N96CXSn6qERkQqsRkdEwKmnMLpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOyKtyGiw4R35+cQwJzIRKbOUcM5jG2Lw029k3dBxiy3q5r1r0iBa1pT8T3JHsfuv
	 a7nj6hsTr7uKLww9GJRlRMomasDZ05PZYMJBeTXxYcIOU7n8AaG41zowyTmRcz+1wt
	 h5ykO0hla58PvGtVSXoUdDz2mhTPszr6H5PEnIWIVWYCq6kSsGez5GkzxSillNnGZB
	 Anok5gtr5T61ZSZgYrb/Adj+xTWapsNgVeXSM82qZ28UuoeU2sSaNWl8H7KhrlwUn3
	 +5tlGup1Pd1RWHTQ8tCYqmf/N5c93MmUKsDabdSqJXdEbBZ4q9mx1LBv9YPJtJKrZl
	 up3TkdcO9Qx4Q==
Date: Fri, 21 Jun 2024 00:57:21 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>, Li Zetao <lizetao1@huawei.com>,
	Chancel Liu <chancel.liu@nxp.com>, Michael Ellerman <mpe@ellerman.id.au>,
 dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org, Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [Patch v4 10/10] i2x: pnx: Use threaded irq to fix warning from
 del_timer_sync()
Message-ID: <jgqhlnysuwajlfxjwetas53jzdk6nnmewead2xzyt3xngwpcvl@xbooed6cwlq4>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com>
X-MailFrom: andi.shyti@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6CL54LG25AYQ2RBO5BEIGJDT5ZO65BAW
X-Message-ID-Hash: 6CL54LG25AYQ2RBO5BEIGJDT5ZO65BAW
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:20:33 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6CL54LG25AYQ2RBO5BEIGJDT5ZO65BAW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Piotr,

On Thu, Jun 20, 2024 at 07:56:41PM GMT, Piotr Wojtaszczyk wrote:
> When del_timer_sync() is called in an interrupt context it throws a warning
> because of potential deadlock. Threaded irq handler fixes the potential
> problem.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>

did you run into a lockdep splat?

Anything against using del_timer(), instead? Have you tried?

Thanks,
Andi
