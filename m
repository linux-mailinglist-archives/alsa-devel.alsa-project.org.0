Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8586B9D0393
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Nov 2024 13:26:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E72E1EB;
	Sun, 17 Nov 2024 13:26:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E72E1EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731846373;
	bh=2Vzu3RlYgWlUg+kP8l3nTLXS8GOcuKbfykkwWU/BOFg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jx0Or7iaWkSns9q2jOq1yWfZ136U4tyBe7IALV7zaDX/kR4Jt82L/wBfze56+mH4B
	 1Z3kDid+bpDhjEuNxC0KsMspTOian+e/iG7F4doOmoE4RoIIXv3JGGjlLLrruC1HfS
	 u8IUc9oJ9kvrykX1oM6hYKDdLdbW3emBq8QONEhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B24BF805BF; Sun, 17 Nov 2024 13:25:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4F4EF80508;
	Sun, 17 Nov 2024 13:25:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46AA6F80517; Sun, 17 Nov 2024 13:25:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1778F800D2
	for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2024 13:25:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1778F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mTU1+u6c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846322;
	bh=tp2Q+8b3zGUBih3afpuzhAn88G4uKrpXKwQ9ivMWqHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mTU1+u6copmZDAjfqnXWv+2ujIPjQ3JtoGu9so550WGMXDTKHgPRUtKWL5WTQKacA
	 ukYIXyZnvXaIaM7phYyg2ffevuNcZwkVM+fGzA0yJe4hA6ivVJfsyMN2k5es56Dca2
	 xnyEpYxwi2vRkSTSXt4SDnE54vHeCtrhpgtS0p+MhXC1a/iPqUZ6noNUE4xD/tX6x3
	 9xyLmagErBzssEeKDZj2zkr4owFCFT2YctuTq6qJ9KGCJplX90TRwhVHol5EujIAFV
	 JLHuHIFQhKPYuj26daIFU9Gqj0sP+YYyQFfmqJ5wJevMLVh4tXn5ub20TQGEUboHP9
	 4WeeB6bi4EbDw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqhp5Zp2z4xf5;
	Sun, 17 Nov 2024 23:25:14 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, audit@vger.kernel.org,
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-mm@kvack.org,
 maple-tree@lists.infradead.org, alsa-devel@alsa-project.org,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, dccp@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>,
 drbd-dev@lists.linbit.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-leds@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, tipc-discussion@lists.sourceforge.
 net, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-trace-kernel@vger.kernel.org, Neil Brown <neilb@suse.de>,
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 00/35] Reorganize kerneldoc parameter names
Message-Id: <173184539760.890800.14513086226459117952.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EQPLALXWIDGIVLUXVE5TXZUN4ROXJD66
X-Message-ID-Hash: EQPLALXWIDGIVLUXVE5TXZUN4ROXJD66
X-MailFrom: michael@ellerman.id.au
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQPLALXWIDGIVLUXVE5TXZUN4ROXJD66/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 30 Sep 2024 13:20:46 +0200, Julia Lawall wrote:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
> 
> The misordered cases were identified using the following
> Coccinelle semantic patch:
> 
> // <smpl>
> @initialize:ocaml@
> @@
> 
> [...]

Applied to powerpc/next.

[11/35] powerpc/ps3: Reorganize kerneldoc parameter names
        https://git.kernel.org/powerpc/c/276e036e5844116e563fa90f676c625bb742cc57

cheers
