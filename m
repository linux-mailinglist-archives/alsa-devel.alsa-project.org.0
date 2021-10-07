Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15135425054
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 11:49:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0897829;
	Thu,  7 Oct 2021 11:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0897829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633600179;
	bh=qd7kluRu5cKVXNfP+NrNpCRiRCxNL9FJkxiisrNtYzM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DG2mwzCutTJFcWawcf95OIPSI2RBV5uvKKnHViXddyVTESd1jYFzDxZOnaQ2iGXwA
	 czquMTW3t/b7jmKLYE+3sWcRhGKEeZhLKVl6dgTiTMDR6SPWJ5OOEHypmuc6VvpL+T
	 Cx07L2X/Ybvo0nijlr9ywvRkvpbbrRZk/H4mAfeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3461AF8028B;
	Thu,  7 Oct 2021 11:48:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17431F8027D; Thu,  7 Oct 2021 11:48:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dnyon.com (unknown [IPv6:2001:ba0:1800:12f::1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDD5DF80130
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 11:48:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDD5DF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="L7+U4QBw"
Received: from dnyon.com (55.red-81-39-194.dynamicip.rima-tde.net
 [81.39.194.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id 0E1443FD71;
 Thu,  7 Oct 2021 09:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1633600073; bh=qd7kluRu5cKVXNfP+NrNpCRiRCxNL9FJkxiisrNtYzM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L7+U4QBwCMGyl+J+gFJ4w569/sVHmCHJ/cv/+NK/69qyg5/UHGmRJDHvJJMKwWcnC
 i/Eiwg7nIWfMrlYeP4c5rVQPR8HE+uc1kaG4HD/a4mB6nnOD1PsUeok00w8M92KHp0
 0RKOFJxTxx9X9AZSiHZ1f24so4LK00CuznGzPWfCLeseF95DgY27uw6UK8bFq7lYEj
 /QHMRxiDPMAMtfjTTVeEIJ9eTkvP/pewzN6VJ5xm/m0c1CWKy8FgiS1aq3fo3Ig0RS
 YlUDZ5eB4klGSH+/V60Ky9S0pHSo47b+5VS+wNF9MjpX6zJnBkAVnYPsYSCqRlEncI
 H+n2TSDTlgISw==
From: Alejandro Tafalla <atafalla@dnyon.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: sound: max98927: Add reset-gpios
 optional property
Date: Thu, 07 Oct 2021 11:47:46 +0200
Message-ID: <5529627.DvuYhMxLoT@alexpc>
In-Reply-To: <CAHp75VdbZmGeCq8A1E3AJU4T39xPUhomzrQqZNaDj8Zi0x9WrA@mail.gmail.com>
References: <cover.1633572679.git.atafalla@dnyon.com>
 <4682758.31r3eYUQgx@alexpc>
 <CAHp75VdbZmGeCq8A1E3AJU4T39xPUhomzrQqZNaDj8Zi0x9WrA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 " <~postmarketos/upstreaming@lists.sr.ht>,
 =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 7/10/21 9:06 Andy Shevchenko wrote:
> On Thu, Oct 7, 2021 at 5:45 AM Alejandro Tafalla <atafalla@dnyon.com> wrote:
> > On 7/10/21 4:38 Alejandro Tafalla wrote:
> > > Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> > > ---
> > > 
> > >  Documentation/devicetree/bindings/sound/max9892x.txt | 3 +++
> > >  1 file changed, 3 insertions(+)
> > 
> > Sorry, I forgot to add:  Acked-by: Rob Herring <robh@kernel.org>
> 
> And commit messages?

Right, can I resend this patch with the commit message or I have to resend the 
other one too?
-- 
Alejandro Tafalla


