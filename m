Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DB370C078
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 15:55:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ED0C827;
	Mon, 22 May 2023 15:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ED0C827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684763741;
	bh=q3RDJcfu3P9H5+o6X9T1w7ulVs6RDbl47mRh0examas=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XUZA2iMd7cBXM/kZsirXCeN2J+32240JkV3+KD7++cXuSXzHBvFLan1DZpokcWF5d
	 J8gNcG02f0a/WwMYOivKAEODeOByRx/TQM0J9uZHiYMr/Z6kVg8LztlZlD+uNS0bUy
	 OdNwjOQysIymBIxF2D7DigUqhq3w38q1fjVwjP7s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CED0F80249; Mon, 22 May 2023 15:54:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A706F80249;
	Mon, 22 May 2023 15:54:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21875F8024E; Mon, 22 May 2023 15:54:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 63254F80086
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 15:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63254F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dU4g9QeT
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MDA9nU024128;
	Mon, 22 May 2023 13:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=iLdM+YTiB4Ar1aYJSLHnL52KDJQTNxM1cOAPGR05Xdg=;
 b=dU4g9QeT1zR3JWjp2grQM29RAEphhwu72hGDHeCWIiErpMILa3di+r0y7bxCC0OweyaQ
 K17EYrb70QJj07zFoG67oYiTjIqIHz6EsgyHnt4CeByIWhAODXJ1MNf3pnf9py2Ub9Nl
 tx/TODnqzZ36ipmyERZdDfisTiKTgKDVZu7stRdr1BoT5g4TmJBx/AGtwCjomM2+1F/J
 65Cf9lIOCiY2TxPVAb20+6UxKKbORHdYOa/fLLkz891L5IEu8TZbZgdPnswioTfBo75T
 i3rMxDw3r/0Thjw02zxnhsseafIeFoOde6bnR+CNUSnfBMGxE2N0uOWxL6PugK8LrrY+ 1g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qqfq3f58c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 May 2023 13:54:42 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34MDAhab027851;
	Mon, 22 May 2023 13:54:42 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qqfq3f56q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 May 2023 13:54:42 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34M3fj1w027623;
	Mon, 22 May 2023 13:54:40 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qppcu904h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 May 2023 13:54:39 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34MDsbcL33554932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 May 2023 13:54:37 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E09220049;
	Mon, 22 May 2023 13:54:37 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A6CE2004B;
	Mon, 22 May 2023 13:54:36 +0000 (GMT)
Received: from [9.171.23.45] (unknown [9.171.23.45])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 May 2023 13:54:36 +0000 (GMT)
Message-ID: <c63aaec4da1d9e8b8b48cf037b3d859c62ee1a59.camel@linux.ibm.com>
Subject: Re: [PATCH v5 32/44] sound: add HAS_IOPORT dependencies
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Rafael J.
 Wysocki" <rafael@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt
 <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-pci@vger.kernel.org,
        Arnd Bergmann <arnd@kernel.org>, alsa-devel@alsa-project.org
Date: Mon, 22 May 2023 15:54:36 +0200
In-Reply-To: <87cz2sy3t3.wl-tiwai@suse.de>
References: <20230522105049.1467313-1-schnelle@linux.ibm.com>
	 <20230522105049.1467313-33-schnelle@linux.ibm.com>
	 <87cz2sy3t3.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: q4KoBRyJFhYMlNCzkM3e9tKYxb8Q82xy
X-Proofpoint-GUID: 1_f1mYGJMse_Cr5AQntxJm-aI4Itain9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_09,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=724
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305220113
Message-ID-Hash: JCVN4DNKP4MS5QV2PV4U3IEPFHMVSOMT
X-Message-ID-Hash: JCVN4DNKP4MS5QV2PV4U3IEPFHMVSOMT
X-MailFrom: schnelle@linux.ibm.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JCVN4DNKP4MS5QV2PV4U3IEPFHMVSOMT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 2023-05-22 at 13:59 +0200, Takashi Iwai wrote:
> On Mon, 22 May 2023 12:50:37 +0200,
> Niklas Schnelle wrote:
> >=20
> > In a future patch HAS_IOPORT=3Dn will result in inb()/outb() and friend=
s
> > not being declared. We thus need to add HAS_IOPORT as dependency for
> > those drivers using them.
> >=20
> > Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> > Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> > Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
>=20
> Looks good to me.  Would you like the patch picked up through
> sound.git tree, or rather apply all through a different tree?
> In the latter case:
>=20
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
>=20
>=20
> thanks,
>=20
> Takashi

With the Kconfig addition of HAS_IOPORT merged in v6.4-rc1 this patch
can now go independently via the the sound.git tree. Our plan is to get
as many of these per-subsystem patches merged for v6.5 as possible such
that then only a small number (ideally zero) of patches remain before
the last one can be merged removing inb()/outb() etc for HAS_IOPORT=3Dn.

Thanks,
Niklas
