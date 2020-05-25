Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBE91E1556
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 22:52:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEFA8172D;
	Mon, 25 May 2020 22:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEFA8172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590439966;
	bh=d1kcx4xcAIT3JRZ/waeyRvIctY1/mvcujJNgy5Kjj1U=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TWpe/+n1V9eqEfRnnE1+iXjHLhBcbr6GvcjsELzanKO0YY8wywT5XeOPjDVPkpxMr
	 E8uELQmqqhh3sjfeQmYNVsqQXusEzHW1GUOrcPak6rAF6Vjsxq+E+AvCmNEEl2rYKM
	 XMV//4T7lryCQVku9D3UqPHKmHpLuwi+ScYQ9Sfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6610F80149;
	Mon, 25 May 2020 22:51:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F9CEF8016F; Mon, 25 May 2020 22:50:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760139.outbound.protection.outlook.com [40.107.76.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8407F80149
 for <alsa-devel@alsa-project.org>; Mon, 25 May 2020 22:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8407F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=northeastern.edu header.i=@northeastern.edu
 header.b="s9Lz8yJr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpNzvZY//Lihqfc8nv5hFKDRGlB4ngBJF3oKtt3YjOQaEj8n2I4hQr8bsWRhhnmWKzqdl3paGZ6lhbEYq7iO6KLbfQQk9OSNFiU0l7JhSomYaNe8frJouLFtuUZDoXcxzoaPxErBQI2MSa1T9BQe3HvMX9gqA/JhYBml+Ln9YjdeRwv+DZuKQsPIIcl7SW3VSvtlqd6Qb1XGcv6JZST9g8tTmetIHk0KlFiVS12+KAyM0/QKfEW9TSyfRAWfjirjL0ySbqO0rsvO7CJzPEBXxTTWETeVJxfKJOXX6ARaGZwYxS3oDbjsJhSD3qQUPBeQ+ZDAtPtLPVQXu80Tz4vBvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2wTPd3fSqek7lKTSOdfHcPbf9kNkSSbDiQxSEt/f+U=;
 b=LoVDrr2/pzyscZ8ujRjqlBOGtlxqVBYi9uUx/+8VfcqZqZuRDyeB4esUmHbG/t8S/sA/plzMy7mOx869+ATwZqE6VUkKETeNj+S0AG1Aei5HmvllSuzxmmVdsxQm+lyMa/ia+n8lg+t9zLLt8GZZ3DpMsAb1G7nkmxKGgChp9QKkD2IeGbBaKBJFjlXcb/afxrK0pBAUSFlhIuVVUrOHFPDSioNKvf7NV4ufgaXigpdb433WVt6yzXOxNdgDePgiL7eXEHl6zkdLwPkKpgNQgfII6tqrKGH60xWEun92PpLPEYIkm+iUSuaDCct2p0wl9K4fZqUxQrdgyKNsswr/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2wTPd3fSqek7lKTSOdfHcPbf9kNkSSbDiQxSEt/f+U=;
 b=s9Lz8yJr3KWpsk7eGrPKXfmzozY/be1SjNTtDgbBHrKC/bcN5T+iLfsBaQiuo+bebPK0VDNTjKAbNd3ziwQrlFCkJWJLJjapPhnM/07vDtF2eWPYE4TiAz6zfHlky3FJZVaOwoJf0TqjnBYqiy21WAP/KEIYrlsOrdtmKoQgA78=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4420.namprd06.prod.outlook.com (2603:10b6:208:43::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Mon, 25 May
 2020 20:50:47 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d%3]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 20:50:47 +0000
From: Changming Liu <liu.changm@northeastern.edu>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: [Bug Report]Sound: sound/core/hwdep.c undefined result by left
 shifting 1 by 31 
Thread-Topic: [Bug Report]Sound: sound/core/hwdep.c undefined result by left
 shifting 1 by 31 
Thread-Index: AdYvxyMM7rMGCavGQk29qC9H1Ig8+ACs6ziAABZ6mlA=
Date: Mon, 25 May 2020 20:50:47 +0000
Message-ID: <BL0PR06MB45485F0B43CCC603DFB0A867E5B30@BL0PR06MB4548.namprd06.prod.outlook.com>
References: <BL0PR06MB4548066F35C44C55459B3F60E5B70@BL0PR06MB4548.namprd06.prod.outlook.com>
 <s5hk110uyl8.wl-tiwai@suse.de>
In-Reply-To: <s5hk110uyl8.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=northeastern.edu;
x-originating-ip: [128.227.216.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf984c02-220b-41b2-f59e-08d800ed4d3f
x-ms-traffictypediagnostic: BL0PR06MB4420:
x-ld-processed: a8eec281-aaa3-4dae-ac9b-9a398b9215e7,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR06MB44205C00E420E2332FE1FB66E5B30@BL0PR06MB4420.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CRoZDEiiDQvw/J9zKUztHq3I2lKJwMM2lRJRrlE2gDtQA7GoMfbvJXWiJ5L7aGKfm/25uKIpxn6bAs5AyTQtWagQ7ZzLQJ++q85/siQF8TxAQFuA3+cAO2Gx76XmtYHXKwRg+xLGwD1q0JQ9M0D8TCRnMz21UtrBdhyho9yBWWsVOL+gn1w1p3O/5xTEjFaIWMjgSfkTkh2ZbsbJvxlCT5kDZRDuu/zsGn2KAyDUhmKzpVPr8rwat/INce058E12hResPUaAjJiEX2IzW4Bjok8l0dBbqxbPnh6BYYNuhWiuppimcMuEEKX1OOkqVPq0CHQGYG8Tj+nYWXMAw2Y6EQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR06MB4548.namprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(8676002)(75432002)(186003)(71200400001)(52536014)(4743002)(55016002)(6916009)(9686003)(33656002)(66946007)(66556008)(478600001)(66476007)(66446008)(76116006)(64756008)(4326008)(2906002)(86362001)(54906003)(786003)(316002)(53546011)(5660300002)(6506007)(8936002)(26005)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 7mjEXp5g1rJboHnYcjir0AwmoRBFfn6lMw4ysYOaq4CAXzHeEoK00y+T3wgMMj3Bad6ht+PsfkrC3paS6zXfhYVSEOg/zbNwXqiuGmZB8be+6vu4g9F+0QHRiTVMCA8mEo9wMhbCxLL1g9j2nDXOqTiwFtENpJpv6OYL43+zQU/3b/1dcVFnqrkbyX28zShS3bQnkucR4ZDFJOuJO+aeT340KjmYnLeDFqnten1ompNufVCl/HL+fu7WYfecRyl/vSWASQlzuWnD20ZflXYsaj4knDW6vCRbU7draGgY38fai8Get279mOoaHvf4pxSAd3raPQw8CxikXVmNBrGsoRaWIsSAGDr/kcFATv/uQlu6Zk3TT1pBDURDNV2LIAjC7d/pc99UhD/Vb8hpi1WuRgXjNetYU9W34Jn0OX+bcViMpf3EwT+kItuUcOf85MbqHwAnYvZQ/naumsegnaUH2EaH9JVHX8u1cF/BCwZ/RKeUtqebD2z3tleZ6lgugLO/
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: bf984c02-220b-41b2-f59e-08d800ed4d3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 20:50:47.4762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b3e5JMWJ3u6xYTqnaiejYfXBL4/wiMbhShxQYh1mj3NBXSZflVZEWgkF+/PhASjdFgQT8VlhTN5aU/qoIyiLsx+ZLzQwLIl0q4reBtYlMBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4420
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Lu,
 Long" <l.lu@northeastern.edu>, "tiwai@suse.com" <tiwai@suse.com>,
 "yaohway@gmail.com" <yaohway@gmail.com>
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


> From: Takashi Iwai <tiwai@suse.de>
> Sent: Monday, May 25, 2020 5:57 AM
> To: Changming Liu <liu.changm@northeastern.edu>
> Cc: perex@perex.cz; tiwai@suse.com; alsa-devel@alsa-project.org; Lu, Long
> <l.lu@northeastern.edu>; yaohway@gmail.com
> Subject: Re: [Bug Report]Sound: sound/core/hwdep.c undefined result by le=
ft
> shifting 1 by 31
>=20
> On Fri, 22 May 2020 01:32:00 +0200,
> Changming Liu wrote:
> >
> > Hi Jaroslav, Takashi:
> > Greetings, I'm a first year PhD student who is interested in using UBSa=
n for
> linux.
> > After some experiments, I found that in sound/core/hwdep.c function
> snd_hwdep_dsp_load
> > there might be an undefined behavior that might cause unexpected result=
.
> >
> > More specifically, in this function,info was fetched from user space an=
d,
> > info.index was checked if it's greater than or equal to 32.
> > If not then it's used as number of left shift bits to string literal 1.
> >
> > The problem is, since string literal 1 is by default signed int, so 1 <=
< 31 cannot
> be represented as a valid integer and
> >  the result might be undefined across different platforms. So I guess c=
hange 1
> to 1U might help?
>=20
> Yes, that should work.
>=20
> > Due to the lack of knowledge of the interaction between this module and
> others, I'm not able to assess if
> > this is critical or worth fixing. I'd appreciate if for your comment on=
 this bug.
> This can help me understand UB a lot!
>=20
> I don't think this is any serious problem.  It's a bit flag that just
> indicates the status and the flag itself has any influence on the
> behavior of the rest in kernel.  And, the hwdep DSP load feature
> itself is used very rarely, only by a couple of drivers.  So it's
> pretty much never hit.
=20
Thank you for this valuable information which vividly demonstrates=20
how inter-module interaction affects the severity of an undefined value.
It's valuable.

> That said, we can simply fix the issue at any time, and it's "just to
> be sure".  Could you submit a fix patch in the proper format?
>=20
Sure, it's a honor, I'll submit a patch fixing this in a separated email.

Thanks,
Changming

