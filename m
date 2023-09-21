Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A437A9322
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 11:34:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72E03A4A;
	Thu, 21 Sep 2023 11:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72E03A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695288887;
	bh=LezdMDEc1W/GtB7TW/3tfQGA3HxJB1xzWkvo/jCKazc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KeDr0l3Q0T8fg/rQi26jvNAb0Vx7K2gpgstp+DqEg1Od/wzHQ97gGyF3XlDmew/h7
	 MJeSZOraHU5YZbNn5ByEULNZJ6fp6qqtlcjgJMgUmg4/PSG6w78UT2gILCd6aYYg4N
	 tw+0iBszmSRQxysqFOKYq2S/4w7j7ltf1ro1kgxk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05CC4F800AA; Thu, 21 Sep 2023 11:33:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A76FF801F5;
	Thu, 21 Sep 2023 11:33:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03A49F8025A; Thu, 21 Sep 2023 11:33:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F40FF80124
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 11:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F40FF80124
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rrqvj0M5wz4xPc;
	Thu, 21 Sep 2023 19:33:21 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: alsa-devel@alsa-project.org, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
 Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, linux-mmc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-media@vger.kernel.org
In-Reply-To: <20230907095521.14053-1-Julia.Lawall@inria.fr>
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
Subject: Re: [PATCH 00/11] add missing of_node_put
Message-Id: <169528860030.876432.17353767421208248949.b4-ty@ellerman.id.au>
Date: Thu, 21 Sep 2023 19:30:00 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OIKGGDOEDPM2V3XRAMJ2Y7SOMEZ6646V
X-Message-ID-Hash: OIKGGDOEDPM2V3XRAMJ2Y7SOMEZ6646V
X-MailFrom: michael@ellerman.id.au
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OIKGGDOEDPM2V3XRAMJ2Y7SOMEZ6646V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 07 Sep 2023 11:55:10 +0200, Julia Lawall wrote:
> Add of_node_put on a break out of an of_node loop.
> 

Patches 3 and 6 applied to powerpc/next.

[03/11] powerpc/powermac: add missing of_node_put
        https://git.kernel.org/powerpc/c/a59e9eb25216eb1dc99e14fc31b76aa648d79540
[06/11] powerpc/kexec_file: add missing of_node_put
        https://git.kernel.org/powerpc/c/06b627c1236216ac1239c5e1afcc75359af3fb72

cheers
