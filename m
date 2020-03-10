Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 617321803E2
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 17:46:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03381166D;
	Tue, 10 Mar 2020 17:45:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03381166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583858788;
	bh=gSkogLM885I/RNpPluWRGk9tL+zflSK8M72UpOjWcBs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eCHT6ixRtbZGXxMWIQscqDM6HnVBMykDzYeVKocmp9TMwYdnu4x+yNEF2Q3Zh9nsT
	 vTVV/3pApIBPQYwtxiPYJxelmRQ4tIO3iUPcVr3SXa0Nw70SaU3lC6b6dUv5aCIfZX
	 QgEcYwHaG8fPgOrx8LFgj3S6f+sXzhttmaxXprTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 096D0F800BC;
	Tue, 10 Mar 2020 17:44:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FBDCF80217; Tue, 10 Mar 2020 17:44:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23155F800BC
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 17:44:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23155F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RzoW97gC"; 
 dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com
 header.i=@cirrus4.onmicrosoft.com header.b="TbZZbpii"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02AGaXIF016625; Tue, 10 Mar 2020 11:44:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=PODMain02222019;
 bh=1mUK7maACODudBphXRL9U+rGnJkLFMYM9BziyGjACik=;
 b=RzoW97gCldD2/yadhtaRGtQnCxlc6orgMngvm9tw4R+Qx4ibYvWE00DD9gzU8EYIJH5v
 XA4k4IlhQLreTr4lHb2EiZtgXp4yn+HORnz6sZOIJHEzXoU4MptxTyQCkYB+iZvvsMSt
 P0N20/YKG16YfofQCbJ/V43QnNNtbMNGtg31lAoYlE9LD9+tMwRz6qjlqUcSIBrNhueP
 Tng7jZE7f8BAp9qp2yBzAOhLVrxpUl8O1Eoge1eGuya2O/SnB8yzjlx4MOOzoMoH0upt
 JBtf4aoLVodpQZUI0kwyjh0EcoTfueMsXq03c47bosavF1apESZx0wY4AwcfgvT1518b tA== 
Authentication-Results: ppops.net;
 spf=pass smtp.mailfrom=James.Schulman@cirrus.com
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by mx0b-001ae601.pphosted.com with ESMTP id 2ym8wuw580-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Mar 2020 11:44:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cW1+SOSOrWkKM2LmGkf/Tb1bIDVAcM2brwc/uGtO2Jj4lZ4JtEynMfsgbriROwHSxjbpsLRAsgEbARwFsXf2xXGWNV3j5C6RTDsP6m2tGYjGdEy7VZEJsosE8O12w+bA6qG6tPW0K/GthXFMBifO3kZDqUWTR3VlFFY+/ezC5Jdg5gth28LCVgF4S9a4vz67INN2seDXppa1lmKCo+FheNX05QKAufOhFaNpq4clv8sm4+FchtizjQLtVUFiliV48JegwdXDMIBZE3E4D+WgVDUzH6GG2ru3r2ZU2dwysGW1bO8QRC6Q95YxzBvikFWob5My3P/FVsKRidJNYYyFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mUK7maACODudBphXRL9U+rGnJkLFMYM9BziyGjACik=;
 b=nNoYXT1gwDpelHxBJ9lqLIYHWMErt6QMRKonqqWLW7SDpZM+ssZ4/FmZxtm0St7/n96UWxIWKgccN5vqegyb/+gSFcVBR7QKKiueoVfetk+tCGbMn88++lr0e95rGtCyEB9DnsrnaG1TCbeT3U+ILs2bQNCANRwjorNUB00n56fEhpXmTiuI95BgzOj5vCB2KuIoGlQ4pIetfAronDzV9B8iOVtcTnLohHvPbLC3ScxY9Izw8mvASRzL/fdnVWplTNdQuJyMO2nw/daII2aK/Cvugr127/FMnSNuSE425JbImlAsnpUjtr3i0XgjEgwLz16YSDqJmFtiPabVFc5WPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mUK7maACODudBphXRL9U+rGnJkLFMYM9BziyGjACik=;
 b=TbZZbpiiSck8L0iMsE/7LviOlqUZNVeuNQNCqhojK+Fq95RA7ZsS2xLr7q470YzZyfPBbGv8WGrUf0E7B0i3FQ3YXXnixPr92Y6vUXl01hLB9RZgh27t+SAkxzXHBxn5zSCpZuof7jVVtkXqMhbOV1cIU2TgKsY5oa7MAdSVBhw=
Received: from SN6PR19MB2381.namprd19.prod.outlook.com (2603:10b6:805:64::29)
 by SN6PR19MB2349.namprd19.prod.outlook.com (2603:10b6:805:63::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14; Tue, 10 Mar
 2020 16:44:36 +0000
Received: from SN6PR19MB2381.namprd19.prod.outlook.com
 ([fe80::6083:405f:6d77:5d00]) by SN6PR19MB2381.namprd19.prod.outlook.com
 ([fe80::6083:405f:6d77:5d00%6]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 16:44:36 +0000
From: "Schulman, James" <James.Schulman@cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update Cirrus Logic codec driver maintainers
Thread-Topic: [PATCH] MAINTAINERS: Update Cirrus Logic codec driver maintainers
Thread-Index: AQHV8/uvTLLDbdTF00mNe25R2BUq/qhByUWAgABFHgA=
Date: Tue, 10 Mar 2020 16:44:36 +0000
Message-ID: <alpine.DEB.2.21.2003101141560.11219@james-tower>
References: <alpine.DEB.2.21.2003061508150.32557@james-tower>
 <20200310123711.GA53842@sirena.org.uk>
In-Reply-To: <20200310123711.GA53842@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [141.131.2.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad68ef2e-b710-4ff9-27e1-08d7c5125176
x-ms-traffictypediagnostic: SN6PR19MB2349:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR19MB23498B727721342566745582E4FF0@SN6PR19MB2349.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(7916004)(396003)(376002)(39850400004)(366004)(346002)(136003)(189003)(199004)(4326008)(8676002)(91956017)(76116006)(71200400001)(66446008)(64756008)(66556008)(66476007)(86362001)(316002)(5660300002)(186003)(26005)(478600001)(66946007)(9686003)(6512007)(107886003)(33716001)(81156014)(81166006)(54906003)(8936002)(6486002)(6916009)(2906002)(4744005)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR19MB2349;
 H:SN6PR19MB2381.namprd19.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cirrus.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DiVvlbihdb2KSfep0PKsEMXMiCJOx5Gg+WoTpY+pFN0KTdUq5nHJFL6ZsgPxgI4ZdXJZnUKU5WnXoqkQDGz8dYBOBv4NZApS7egps/wBOcrYuIjzyYhzzt4bV+oQ/wBBacXFvIeZlfGbmwIJQ1sA0Vwu4RJStfbK3PYCV85FYtvoSTK+SFAlSn5A8CQWBvNAEX6Z7knY15J9YsJMsyyKYOPjTFujeI5p4XmwVcii+1L1V0tLZb9oVDjDl/LtpEB1AyI0smrBEXF5dToSjTyUniuBZcJYJTfOzbOicmvsE35fKQetVcFXT9oW1LksAJlv3b8WhKCg+X1Fbats+jJqElvbmwZ+UiSGXqaoOo3kibDJKh/8m/drPnF1fYF0fsw5H1pplhYqDo1I8s5uY9Tnfzbh885SAeQhLY90dPsBo8PLU9df1Ny8QynXuh3oIZeG
x-ms-exchange-antispam-messagedata: YWZSHXaXAawcHRUYBYqbg10lJe8HvTSiIeXaxvndFsHBR97nFFc4o8lTm1T589ta2Fp/MShhMnvIcccEsfZ25Pfp6itZN6p+qrTufsX+g5eYHm6gb5I5+F+VMy+1TeYNXsVDy+fjplMV2knG0sYy4Q==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4A4C07059AC10349A97B4A51C2613034@namprd19.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cirrus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad68ef2e-b710-4ff9-27e1-08d7c5125176
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2020 16:44:36.0906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o6cstZeDhaSWfx/czEEXO/SXc68TFbwKfJeitgzl84waMvMXBcyHlHBO3+MJomYn11W9ndE32ywWq5PxyaYWSO/MsEuSZpMaQF3JA8KWFnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR19MB2349
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 include:_spf1.cirrus.com include:_spf2.cirrus.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=861 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003100103
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Rhodes,
 David" <David.Rhodes@cirrus.com>, "Austin, Brian" <Brian.Austin@cirrus.com>,
 "Handrigan, Paul" <Paul.Handrigan@cirrus.com>, "Schulman,
 James" <James.Schulman@cirrus.com>
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

Sorry Mark, our corporate email server makes it hard to send SMTP
emails. I'll figure out a better way to do it.

On Tue, 10 Mar 2020, Mark Brown wrote:

> On Fri, Mar 06, 2020 at 09:10:38PM +0000, Schulman, James wrote:
>
>> +++ b/MAINTAINERS
>> @@ -4021,8 +4021,8 @@ F:
>> Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
>>    F:      sound/soc/codecs/cros_ec_codec.*
>>
>
> This e-mail is corrupted so the patch won't apply, you've got word
> wrapping issue.  Please check your mail configuration and resend :/
>=
