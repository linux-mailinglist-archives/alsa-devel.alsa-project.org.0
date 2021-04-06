Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E58E5354C64
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 07:49:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66ACC16D2;
	Tue,  6 Apr 2021 07:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66ACC16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617688191;
	bh=LVENxGBNSOzhywUIIG6o6u1S2hLwatE1m6eByJfdBTM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u4DIYk5b0cNYOvP3f7k4hTUA7RAYGSRoAVoCxdrvle41iaLaxQ9JO8bG0MRzBOTfe
	 QFoJD/xsRzxAJQPqsVDfK1bcQ1liUZvf5ccz+E7+5wHgVdalH2hpd7c2gIx+A0PHmc
	 eGx4zt0cVHZrjNqanaMHN9kEhLOQGleWtbNDXUPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC0B2F80124;
	Tue,  6 Apr 2021 07:48:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C130DF8020B; Tue,  6 Apr 2021 07:48:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 465BAF800E3
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 07:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 465BAF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="gxTHhnFQ"
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1365l6k6006201; Tue, 6 Apr 2021 01:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=bGmnfvIWnZqTQcn9g4p38LZbTcydLcLWgiaFyXLPFus=;
 b=gxTHhnFQEpBnopfnvDNKwHQMIcoqWD2UO93wFnwtQOGDEya13EXCDI38pZGRpLG3r/Bm
 tpIbdurLvOl0w4r9JLoPAzW4V7VjLTQ9XqSNKzJhKhf+wuxrJWCKLkK8hpvjs+AeZDGq
 dHt/TE9qGhkG1hOWBnn8Aw8udha9uulL2qVlg25pBQcA03e+7+niCeppowne65uAxOyU
 reYh1dQndodfryU1Pyx3LkstP+ot/77ndm8m+7EQixJUozGU7EB8Vrcy3tw7yufjB3qJ
 ArKbXWRHd9xdy7WVXuVBvK7CUnwtBxnwsVNZOH8lRSv50GgljgIb/BDT+bzWMhj4HLxs eA== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0a-00154904.pphosted.com with ESMTP id 37q2nsny04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 01:48:12 -0400
Received: from pps.filterd (m0144102.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1365jVsB107225; Tue, 6 Apr 2021 01:48:11 -0400
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by mx0b-00154901.pphosted.com with ESMTP id 37q2pmvag8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Apr 2021 01:48:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJcfQKjACBl0gby1p4joJ4dv9ElGsDpkpoTf36ULIVyWyuC0TnH3btQNWZJnyhI6VX3O4ozyzRpY75aHHTF1O3KtP+frv3KteXyrB3Y0VMs/FaKt4CChg96Uxzj9G3oHAnAKpTXokYcQIp0H2GKuj7NgIO0BaUKioY1BCwaosc1JK4cHCFku7KZH4Cw9yHX/DdYQ7HlNY22IqEpT02qu3SJtDYwIGg5kuXkwHP1A03tHt5kmudgV52Rx/3ot99YotB3lRDQvU+QMFMUNG+ca7RZnLg5ahbQRaY6tjEqckQ6gH9XR06RPeuuFuYLohRGp9i2kMGIx7xTPrMsuVS5vhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGmnfvIWnZqTQcn9g4p38LZbTcydLcLWgiaFyXLPFus=;
 b=gmLyj5QvwfKygR3i8gVQSRLlV9JArg560LT+3pnxK2fkhxVa8SK6PcQVv0Gx/PibcE9AbQ+5TK13mjUPw9RP0MmQRxBMOywWH5gM1u2AzGddtO8cgUgQKGi1glY4GjaxvUOxBkKqCbtO3YZFGvGSuLLXpq61KdOC5lGlgtw/il426VvFbSqSujwmJDKh1V7JY0Nh2VLL6GvOVvak3OFwqfbtNNydT9GtFEZmtNiIIxLQXkL+LyZuVn9uQbgoPM+NNf/jOuHqBkMNp+v2hs8Fp5EcjJM4t+YWNc9rEAnXYjgTWlHhwm9JSx0c6KF6sIoN/0KrzBmnxTk8qwEqoIS2kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by BY5PR19MB4100.namprd19.prod.outlook.com (2603:10b6:a03:222::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 05:48:09 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a%8]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 05:48:09 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: "perex@perex.cz" <perex@perex.cz>, "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "oder_chiou@realtek.com"
 <oder_chiou@realtek.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>, "Limonciello, Mario"
 <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v6 2/2] ASoC: rt715:add micmute led state control
 supportspobrn@protonmail.com
Thread-Topic: [PATCH v6 2/2] ASoC: rt715:add micmute led state control
 supportspobrn@protonmail.com
Thread-Index: AdcqqFVFEH1Q0pbGRju+G9CeiJlZEw==
Date: Tue, 6 Apr 2021 05:48:09 +0000
Message-ID: <SJ0PR19MB4528396E98E7A7204789E3FF84769@SJ0PR19MB4528.namprd19.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [114.84.248.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 320a5688-a275-4ecd-f4ec-08d8f8bf8f25
x-ms-traffictypediagnostic: BY5PR19MB4100:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR19MB41007538868C53C378E22A9B84769@BY5PR19MB4100.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dY6rvjc0h2rTVvN4ZxfyqQQtTXo+05g/4+ksV6nDCQ428vRIDXuYPRKIzNpy/td/ba7j8VWluELDbhTC61RtOOcAfVxyfzylk3VfJi9a3xQjjYIbbTbHxUIGtCsoNW9eeUcBoRALwj5z/pz8ENWLaTC8VldHaAPdo9OSUkc/5G+JpGPAg6Xe9SoKMLoizlsqWix/B9GTv3/WGlyb6zc7VoEg+0myH5Q7wCVzWAHRkQTS3Vr0m3BWMIqHLWb0lESRZceGtf0wNZD0Wae85dNmoZcotX2ql365d1/YX8bTfU/CJguTfZrHq1dy7e1U79xqZvQm9t74mcUu99SUPKuiRjsxohIOrIcVjL5RKWgv3UWnlmFrDigJR5GoZG2lTNY+6/vqtRui/28Tlsfkh7g8EXi+FMpXQytGj8jbckzOhD/9yCv/2IV6T17znIg8gvfIlQl7I1ZBz9f/B68CMWp7VJDK5lRYRl7pa6h++YKMpNN9wxbJdeHD+9O6L7GbwU/57DEnc9iLWjBMh0ispQt+nQjHeu9iZybJnpMAUbxXLYL6RH80NywhJ2kYxj26tU1vgMcwKhkJY/R+3boZZKuoksj2krgWeYkanoaEkcFvCtdWpzGUWuSpri80Linhta1J8fWYKZLHBQN3LcIV+GMNTzk5EZqVk0octZJHlSsz23byOATme8fICQfzBP115x+aYEfhv1EoGz+F5rWn2aV5weFIGNtxfTWPnfJEnZf/NN1J8ehrGFOrsSH5Zig8iZlH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(26005)(64756008)(55016002)(66476007)(86362001)(2906002)(478600001)(966005)(66556008)(7416002)(7696005)(53546011)(6506007)(186003)(66946007)(8936002)(4326008)(33656002)(316002)(71200400001)(110136005)(9686003)(54906003)(45080400002)(8676002)(38100700001)(5660300002)(76116006)(66446008)(6636002)(786003)(83380400001)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?OKBGmlkuk3ne6RQPKN+HZXX7bDwy3TeKEU3bKRIm8had6nx71MLheHC1TbLf?=
 =?us-ascii?Q?d2B06lpkxGlUd+Rd0+zFblRbavnG0myTUwe7xOn34biFEkktXBPLI/5H9eoV?=
 =?us-ascii?Q?J1iJwwudlOg+i2S22qFlXiJN+ZaBnur53LaSI3f9iCEd8v2A5z2aMvW2to5s?=
 =?us-ascii?Q?LnRhF2WBH307dtxAwyh21Aujzk9RfuV1KgfX21sn8puy+E64lhwZvXCNx4oG?=
 =?us-ascii?Q?L3MIiMUTPtfFrXBfStDPqBs68RJST8Kbk3ZCYPUzpvaSrm9ULYtwRECk7EqV?=
 =?us-ascii?Q?nEnmWW5ULKE4iqGnmpmc7hZh7dE0cpYQTI4wId0qMRIQe7P5EonKAnG+BvTf?=
 =?us-ascii?Q?vvGs8b6Y1Vvm5yfgFOhRjrQCcFWyPQ4wxLb5KDOq3GPnWxLfc3QEqJZTu/hB?=
 =?us-ascii?Q?mXCzwh65xjQ17cvOAqbDvuYcE+3O3FH/zcfqE8mutStQHzRLE1nLOzBg467V?=
 =?us-ascii?Q?FvW/9LeM0JThtofxGBSJpSLeoUTI1I4Mq5e8XPr0d7Em15AoblKxBZDyx/N7?=
 =?us-ascii?Q?y38q4v2Q7YzxzEVDpsXjLE/z9VXoaJdya8q+/r3HmwL/Y3AsoYonNfTEIdPp?=
 =?us-ascii?Q?h+a6uCLJ2iuGR0Wwzs/Bvvf8ZjKwlSHhNsnlaFrVkpvyBSz3V4CJD24xUwVO?=
 =?us-ascii?Q?G6stLINXpZtLvzApN78PlTnqHioo5PQJ++GEdpH0o498VmV+GXYRqNjFtwy9?=
 =?us-ascii?Q?G4JvFZlFPquoWQ2Vu3IBAyW3FzMLboeNEtnEbeTQp3hP+5ct8vKiV8tj3HxK?=
 =?us-ascii?Q?WC3UfEeTuCLvS1WcKRq69lrc+kWSD6DQxciyb54tDixCIiCsR4Bcqc5iyMTl?=
 =?us-ascii?Q?fwG46ycUWu1q6V4WMkEsOzkumrIp4UQUtLA1HAbYHLc95fwfaQrj3LJ+66IV?=
 =?us-ascii?Q?p/JkNy5rgzJywV95lZkGoUCil026ScQ19o6qnSUX8DKNTViJ3BJ7d4SMzWbF?=
 =?us-ascii?Q?VGxxDsM+ZURmuqvnQ8vNrV0Nm6vmJPE6yNbX+bBPSBJphGkmp9v4aXr6x+cW?=
 =?us-ascii?Q?FSkbjcvY6r1CzRj8KrGslCx60tcRtRwq2r31LX/xYD5SIiJNn9bGm+Vtmxmz?=
 =?us-ascii?Q?11ILHNUapN0SuaDncd9KCcGznKU1pWNYFJcCNGUc02ERMtCxcP0oXczceqSq?=
 =?us-ascii?Q?zo9MQC3XGLcezqxUhRp0mXfhoKTFWlPn45+/s+Jph83nZLe7oto1UP6QOrPO?=
 =?us-ascii?Q?ik0oJLTHmHejfmPk99V2tlsbTgeId9BA2dtRphdyCY35Q6/9XPr6GvGyUdkV?=
 =?us-ascii?Q?n6KhCsAZlFrviNXk0ILGKWntHQwwvDQaY4gSGxetIOGvanZbp1hNbUZt0W2X?=
 =?us-ascii?Q?b6CHFFd5FNi728wM5eDQh/Oy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 320a5688-a275-4ecd-f4ec-08d8f8bf8f25
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 05:48:09.5164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n3Pl2uI8sw2eYwnX+9IiQIRFff5DNFOnuGmPu6H9jDUm/jnXc8TRHA1KPJPHDTllZH0kqMOx+oE8OM/1ng75Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4100
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_01:2021-04-01,
 2021-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104030000 definitions=main-2104060039
X-Proofpoint-ORIG-GUID: WaAw6kB2Avw0vd3-V96yBm58haRwi2dj
X-Proofpoint-GUID: WaAw6kB2Avw0vd3-V96yBm58haRwi2dj
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104030000
 definitions=main-2104060039
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Dell Client Kernel <Dell.Client.Kernel@dell.com>,
 "mario.limonciello@outlook.com" <mario.limonciello@outlook.com>
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

Hi Jaroslav:


> -----Original Message-----
> From: Yuan, Perry <Perry_Yuan@Dell.com>
> Sent: Sunday, April 4, 2021 4:32 PM
> To: pobrn@protonmail.com; pierre-louis.bossart@linux.intel.com;
> oder_chiou@realtek.com; perex@perex.cz; tiwai@suse.com;
> hdegoede@redhat.com; mgross@linux.intel.com; Limonciello, Mario
> Cc: lgirdwood@gmail.com; broonie@kernel.org; alsa-devel@alsa-project.org;
> linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; Yuan,
> Perry; mario.limonciello@outlook.com; Dell Client Kernel
> Subject: [PATCH v6 2/2] ASoC: rt715:add micmute led state control support=
s
>=20
> From: Perry Yuan <perry_yuan@dell.com>
>=20
> Some new Dell system is going to support audio internal micphone privacy
> setting from hardware level with micmute led state changing When micmute
> hotkey pressed by user, soft mute will need to be enabled firstly in case=
 of
> pop noise, and codec driver need to react to mic mute event to
> EC(embedded controller) notifying that SW mute is completed Then EC will
> do the hardware mute physically within the timeout reached
>=20
> This patch allow codec rt715 and rt715 sdca driver to change the local
> micmute led state. Dell privacy led trigger driver will ack EC when micmu=
te
> key pressed through this micphone led control interface like hda_generic
> provided ACPI method defined in dell-privacy micmute led trigger will be
> called for notifying the EC that software mute has been completed, then
> hardware audio circuit solution controlled by EC will switch the audio in=
put
> source off/on
>=20
> Signed-off-by: Perry Yuan <perry_yuan@dell.com>
>=20
> --------
> v5 -> v6:
> * addresed review comments from Jaroslav
> * add quirks for micmute led control as short term solution to control
>   micmute led state change
> v4 -> v5:
> * rebase to latest 5.12 rc4 upstream kernel
> v3 -> v4:
> * remove unused debug log
> * remove compile flag of DELL privacy
> * move the micmute_led to local from rt715_priv
> * when Jaroslav upstream his gerneric LED trigger driver,I will rebase
>   this patch,please consider merge this at first
>   https://lore.kernel.org/alsa-devel/20210211111400.1131020-1-
> perex@perex.cz/
> v2 -> v3:
> * simplify the patch to reuse some val value
> * add more detail to the commit info
> v1 -> v2:
> * fix some format issue
> --------
> ---
>  sound/soc/codecs/rt715-sdca.c | 41
> ++++++++++++++++++++++++++++++++++-
>  sound/soc/codecs/rt715.c      | 41
> +++++++++++++++++++++++++++++++++++
>  2 files changed, 81 insertions(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.=
c
> index 20528afbdc57..7bd7ad0ba7d7 100644
> --- a/sound/soc/codecs/rt715-sdca.c
> +++ b/sound/soc/codecs/rt715-sdca.c
> @@ -11,12 +11,14 @@
>  #include <linux/moduleparam.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/leds.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm.h>
>  #include <linux/soundwire/sdw.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/platform_device.h>
> +#include <linux/dmi.h>
>  #include <sound/core.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
> @@ -344,6 +346,34 @@ static int rt715_sdca_get_volsw(struct snd_kcontrol
> *kcontrol,
>  	return 0;
>  }
>=20
> +static bool micmute_led_set;
> +static int  dmi_matched(const struct dmi_system_id *dmi) {
> +	micmute_led_set =3D 1;
> +	return 1;
> +}
> +
> +/* Some systems will need to use this to trigger mic mute LED state
> +changed */ static const struct dmi_system_id micmute_led_dmi_table[] =3D=
 {
> +	{
> +		.callback =3D dmi_matched,
> +		.ident =3D "Dell Latitude 9420",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude
> 9420"),
> +		},
> +	},
> +	{
> +		.callback =3D dmi_matched,
> +		.ident =3D "Dell Latitude 9520",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude
> 9520"),
> +		},
> +	},
> +	{},
> +};
> +
>  static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
>  	struct snd_ctl_elem_value *ucontrol)
>  {
> @@ -358,6 +388,7 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol
> *kcontrol,
>  	unsigned int mask =3D (1 << fls(max)) - 1;
>  	unsigned int invert =3D p->invert;
>  	int err;
> +	bool micmute_led;
>=20
>  	for (i =3D 0; i < 4; i++) {
>  		if (ucontrol->value.integer.value[i] !=3D rt715-
> >kctl_switch_orig[i]) { @@ -393,7 +424,15 @@ static int
> rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
>  		if (err < 0)
>  			return err;
>  	}
> -
> +	/* Micmute LED state changed by muted/unmute switch */
> +	dmi_check_system(micmute_led_dmi_table);
> +	if (invert && micmute_led_set) {
> +		if (ucontrol->value.integer.value[0] || ucontrol-
> >value.integer.value[1])
> +			micmute_led =3D LED_OFF;
> +		else
> +			micmute_led =3D LED_ON;
> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
> +	}
>  	return k_changed;
>  }
>=20
> diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c index
> 34c3357e943b..490cf9e63c2d 100644
> --- a/sound/soc/codecs/rt715.c
> +++ b/sound/soc/codecs/rt715.c
> @@ -13,6 +13,7 @@
>  #include <linux/init.h>
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
> +#include <linux/leds.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm.h>
>  #include <linux/soundwire/sdw.h>
> @@ -25,6 +26,7 @@
>  #include <linux/of.h>
>  #include <linux/of_gpio.h>
>  #include <linux/of_device.h>
> +#include <linux/dmi.h>
>  #include <sound/core.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
> @@ -70,6 +72,34 @@ static void rt715_get_gain(struct rt715_priv *rt715,
> unsigned int addr_h,
>  		pr_err("Failed to get L channel gain.\n");  }
>=20
> +static bool micmute_led_set;
> +static int  dmi_matched(const struct dmi_system_id *dmi) {
> +	micmute_led_set =3D 1;
> +	return 1;
> +}
> +
> +/* Some systems will need to use this to trigger mic mute LED state
> +changed */ static const struct dmi_system_id micmute_led_dmi_table[] =3D=
 {
> +	{
> +		.callback =3D dmi_matched,
> +		.ident =3D "Dell Latitude 9420",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude
> 9420"),
> +		},
> +	},
> +	{
> +		.callback =3D dmi_matched,
> +		.ident =3D "Dell Latitude 9520",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude
> 9520"),
> +		},
> +	},
> +	{},
> +};
> +
>  /* For Verb-Set Amplifier Gain (Verb ID =3D 3h) */  static int
> rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
>  					struct snd_ctl_elem_value *ucontrol)
> @@ -88,6 +118,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol
> *kcontrol,
>  		RT715_SET_GAIN_MIX_ADC2_L};
>  	unsigned int addr_h, addr_l, val_h, val_ll, val_lr;
>  	unsigned int read_ll, read_rl, i, j, loop_cnt;
> +	bool micmute_led;
>=20
>  	if (strstr(ucontrol->id.name, "Main Capture Switch") ||
>  		strstr(ucontrol->id.name, "Main Capture Volume")) @@ -
> 185,6 +216,16 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol
> *kcontrol,
>  	if (dapm->bias_level <=3D SND_SOC_BIAS_STANDBY)
>  		regmap_write(rt715->regmap,
>  				RT715_SET_AUDIO_POWER_STATE,
> AC_PWRST_D3);
> +
> +	/* Micmute LED state changed by muted/unmute switch */
> +	dmi_check_system(micmute_led_dmi_table);
> +	if (mc->invert && micmute_led_set) {
> +		if (ucontrol->value.integer.value[0] || ucontrol-
> >value.integer.value[1])
> +			micmute_led =3D LED_OFF;
> +		else
> +			micmute_led =3D LED_ON;
> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
> +	}
>  	return 0;
>  }
>=20
> --
> 2.25.1
Could you help to review if the patch is acceptable as short term solution?
I added dmi checking when changing the led state for rt715 and rt715-sdca c=
odec.
Thank you!
Perry
