Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C3C6FB569
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 18:42:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8AEA1206;
	Mon,  8 May 2023 18:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8AEA1206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683564172;
	bh=eCQJhpJpFGmIBEu5qBOco8StXsCjYlMC8XYaOqGy814=;
	h=Subject:From:To:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h00N4/R4O4e3aBsXuKrqd3vDeApw64jVqRFd5rtoH4ROeeldgzWkn7dRylYLHFbqF
	 kpwjnTYjaHLGjhKVsZEHqEyxic8604pVT+igdGmNE0sdzmhCznJCjJP/9DVzTg1Ox9
	 iv34I5eLWLGPoZoqYkbLwMZtqKsI4lzWA8HpLozk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F856F80087;
	Mon,  8 May 2023 18:41:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 478ADF8032D; Mon,  8 May 2023 18:41:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A826F80087
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 18:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A826F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CX0nxLwu
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 348GWNCF002890;
	Mon, 8 May 2023 16:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=y9k6cQ4XhKrREyuDzPR2T7/dwcXkNsntOxPMN4zeeQQ=;
 b=CX0nxLwuGz0tx05tSPYVmIdsV/z82ema42hWuN5R7PILkNWielMzHG2wz3H1h1m/ivaf
 ABSC2wcH2bu6TVxRkfeMY73hlAF2b4BKVEmvpEoVnJyRD9C5IrqTSBl+tMaEF7GolGmT
 /I/4AjKfrRCmNknQ3SR9kGYt+Pe0odkC/W6I+ZkjUGn9vtnxup+WXKkvRjBE8V2LRWIi
 Ec1qpqVRkdWgfNRVVOfk5AQfdRPb5TP/wtLbveKBAZM5iaYvcXaw40M/z2fSJRxHZHx4
 TrJ/K6CcQZUOJUI0JZ6Osq/obMsUWPUKScTl3+rLgUb37fzyDIrvNGIrPbjQHjuKMlMF Dw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qf4pj0bgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 16:41:36 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 348GWViJ003580;
	Mon, 8 May 2023 16:41:36 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qf4pj0bfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 16:41:36 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3482spTc019017;
	Mon, 8 May 2023 16:41:34 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3qde5fh8bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 16:41:33 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 348GfVAj36634998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 May 2023 16:41:31 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 629B620043;
	Mon,  8 May 2023 16:41:31 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74F7B20040;
	Mon,  8 May 2023 16:41:30 +0000 (GMT)
Received: from [9.171.75.120] (unknown [9.171.75.120])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 May 2023 16:41:30 +0000 (GMT)
Message-ID: <fd3e549e966264c6055f2b4534c59c627aecba3f.camel@linux.ibm.com>
Subject: Re: [PATCH v3 30/38] sound: add HAS_IOPORT dependencies
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Mon, 08 May 2023 18:41:30 +0200
In-Reply-To: <87y1nzbji8.wl-tiwai@suse.de>
References: <20230314121216.413434-1-schnelle@linux.ibm.com>
	 <20230314121216.413434-31-schnelle@linux.ibm.com>
	 <87y1nzbji8.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XZeJK2cYh6_FJFg96n3m3DSh1lseKFru
X-Proofpoint-GUID: gFwwEY82wt6SRbr9Odeh7yns_RhuKhFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_12,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 mlxlogscore=868 phishscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305080111
Message-ID-Hash: QKTNB72SPIPXOJNCYNLDK66UFLXE6IZY
X-Message-ID-Hash: QKTNB72SPIPXOJNCYNLDK66UFLXE6IZY
X-MailFrom: schnelle@linux.ibm.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@arndb.de>, Takashi Iwai <tiwai@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKTNB72SPIPXOJNCYNLDK66UFLXE6IZY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 2023-03-14 at 13:33 +0100, Takashi Iwai wrote:
> On Tue, 14 Mar 2023 13:12:08 +0100,
> Niklas Schnelle wrote:
> > --- a/sound/isa/Kconfig
> > +++ b/sound/isa/Kconfig
> > @@ -23,6 +23,7 @@ menuconfig SND_ISA
> >  	bool "ISA sound devices"
> >  	depends on ISA || COMPILE_TEST
> >  	depends on ISA_DMA_API
> > +	depends on HAS_IOPORT
> >  	default y
> >  	help
> >  	  Support for sound devices connected via the ISA bus.
>=20
> With this dependency, ...
>=20
> > @@ -31,6 +32,7 @@ if SND_ISA
> > =20
> >  config SND_ADLIB
> >  	tristate "AdLib FM card"
> > +	depends on HAS_IOPORT
> >  	select SND_OPL3_LIB
> >  	help
> >  	  Say Y here to include support for AdLib FM cards.
>=20
> ... this and lots of other similar changes become redundant, as they
> already depend on CONFIG_SND_ISA.
>=20

Good point and semantically it makes sense too since ISA is closely
associated with I/O ports.

> > --- a/sound/pcmcia/Kconfig
> > +++ b/sound/pcmcia/Kconfig
> > @@ -13,6 +13,7 @@ if SND_PCMCIA && PCMCIA
> >  config SND_VXPOCKET
> >  	tristate "Digigram VXpocket"
> >  	select SND_VX_LIB
> > +	depends on HAS_IOPORT
> >  	help
> >  	  Say Y here to include support for Digigram VXpocket and
> >  	  VXpocket 440 soundcards.
> > @@ -22,6 +23,7 @@ config SND_VXPOCKET
> > =20
> >  config SND_PDAUDIOCF
> >  	tristate "Sound Core PDAudioCF"
> > +	depends on HAS_IOPORT
> >  	select SND_PCM
> >  	help
> >  	  Say Y here to include support for Sound Core PDAudioCF
>=20
> I guess it's easier to make CONFIG_SND_PCMCIA depending on
> CONFIG_HAS_IOPORT (like done for CONFIG_SND_ISA).
>=20

In principle I think there could be a MMIO based PCMCIA sound card but
it appears there is none currently supported and I doubt someone adds
one so yeah that makes sense even if it isn't as clear cut as with
CONFIG_SND_ISA.

I've changed both vor v4. Thanks!
