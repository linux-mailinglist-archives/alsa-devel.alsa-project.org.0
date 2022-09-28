Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A867B5EED95
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 08:09:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C46B15CA;
	Thu, 29 Sep 2022 08:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C46B15CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664431759;
	bh=17TBwRqpD5dfbOp3Pb4s+pvFbj1tzqsB54QTG/JBWsc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rqmTYhna5RljIbgabGIqvrtM9JMRzeeW8qp4r+6jv/jptwQzwC8e6YbPxesusaVh/
	 aRnZIOw+hFH0gdmXHcaVHk8h0zFAI6JEa9iolI/ABTotOngaQvy/3v89/D6DtYGB1X
	 t/vzcwXk4N6GFKZNm7tZlApavgiMW9tRZ+liT/tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40999F8055B;
	Thu, 29 Sep 2022 08:06:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08162F80310; Wed, 28 Sep 2022 04:44:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D75B7F800AA
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 04:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D75B7F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com
 header.b="j2UDNbKe"
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S2PwfH009940;
 Wed, 28 Sep 2022 02:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=Hemx582WJkNllLyqhgmZoSe921ld2Bf5S1+8XNfe5hs=;
 b=j2UDNbKerK+msoWEGF/D7wx3plMvPALbRdXGW7lH9u4aVabe0W/rpSZhJ/kI+PVxS6v0
 93ZFScnNtvf1Agm1rcnv3XsuDgOXsQ99pqDNIjSqYgI0R9E2/iJO2IQF45G7NbR12z/Q
 SwzSiPtSow576+MdRx9wLvL63TN5NzaC0PkG91PKOWeIpEf3iO6mcfBsJjuQWfXJUgEs
 ZyyEDEJvrLGJ94bKtaBabFe+xQPkCvY65QNxz/jryhZT8tbdmU0MYyhs1WkzwgjDS3VB
 A6uUfttYlf8QhsfFcCwbs9KbGgPEaDrYBR5JLnxTkejmmgUs/Pat/DrzrtBJykrRXa4+ nA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsq4235nw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 02:44:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5fMpFJAnpopVBcDysrgzXs4Sa/uGHg0+x8MRJ6rKahxjBWtu+k7M7izQTgpBMRoueaVwm4JTkJz8QHVaUWEM+0b4xRh8bIw2HO8mpbpx8JUyLPOo8jIgd+4itJluZKigKwj6WSmzZg7DzkDGXcQT6gewa+oN3cX0U+lsuHK4yBF5f2rkq7pZQ6LPHa4D+P2j8hG1KF7ODBAHG8pmHeuVA0/teNci9BFtHpv9SIFbOcq1IFeDBUf1nl5qijBh1rsKvGHTDV5CfzwJnOFg0cbxEkBYrEnMrPoY0z18Tv8UO7H0NiPDqscdOy5iZVj5VC85w05riCc/hFJpRppqkCEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hemx582WJkNllLyqhgmZoSe921ld2Bf5S1+8XNfe5hs=;
 b=Ecwp4AJeKowUVAasiIEcbtBJBM8n2O6SQT0PFYJX9KQcGg5qKeu0EIfpqYIea3IutrQrmAk/DZQvJtrhPtW/aEHwIkwhndsbd7JIdo1ggxmN3IvVheO2E4LoWIXzoCE09Tym/sF5/xoRAuJGLtBjZAM8xdzv4hHFL0VagDaqVIbpa+G/APlZpkgw1FHhFglez2kNzUD4FhjWWz/vfVOJy92VA41Ts6NlgS2kMF5orUASmK5gzXOOiPBRmybLXdz6OGJZkn3gBnlQg0gyEFWtp/XnVx6d1dnm5Lu5oodJmzePvybK4o+EjbXZZukc2ckrw8DoG5oFOYrnLL9bCUfgKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 by CY5PR11MB6092.namprd11.prod.outlook.com (2603:10b6:930:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 28 Sep
 2022 02:44:31 +0000
Received: from SJ0PR11MB5769.namprd11.prod.outlook.com
 ([fe80::64ea:ed0f:fb4:3f5c]) by SJ0PR11MB5769.namprd11.prod.outlook.com
 ([fe80::64ea:ed0f:fb4:3f5c%3]) with mapi id 15.20.5654.025; Wed, 28 Sep 2022
 02:44:30 +0000
From: "Wang, Xiaolei" <Xiaolei.Wang@windriver.com>
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
 <tiwai@suse.com>, "ckeepax@opensource.cirrus.com"
 <ckeepax@opensource.cirrus.com>, "chi.minghao@zte.com.cn"
 <chi.minghao@zte.com.cn>, "steve@sk2.org" <steve@sk2.org>,
 "aford173@gmail.com" <aford173@gmail.com>, "geert+renesas@glider.be"
 <geert+renesas@glider.be>
Subject: wm8962 0-001a: ASoC: error at soc_component_read_no_lock on
 wm8962.0-001a: -16 
Thread-Topic: wm8962 0-001a: ASoC: error at soc_component_read_no_lock on
 wm8962.0-001a: -16 
Thread-Index: AQHY0t9pmrF1BeCjKUO35FIYuS0UcQ==
Date: Wed, 28 Sep 2022 02:44:30 +0000
Message-ID: <MW5PR11MB57644C9D9797BB1F5B30B70795549@MW5PR11MB5764.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5769:EE_|CY5PR11MB6092:EE_
x-ms-office365-filtering-correlation-id: 6f180365-de52-48a2-a6c7-08daa0fb5e79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: puL/o7mxSbYUdX4jAafZsruknJRnr0OC8iTpuKDGWnBfuPKIINpScWDSMu8kEBHnTEPDxDNsXQnwcN00VEl0CyaPiVZsYGdRwdSIjIS3p6azI4fWzBKrbNxYFHw605hrBQBR/UO0M+MTzApLNmYNAducLNd3s2Zh8qK6qNd/eVmBReGE55RBZVYEBUCE2u3SzOK148W+zwR3H5IPY2gwBVIjjqPBhYYTNuHdXfG+RHHS/XVCeK/1D9fRYX6Cnv3dDCsZQT8G7r7OLQEG61OOxQ50U+BQpI5EplS0EIXA38NF+i7bxrQrk/HbTuQ9Snw1K1CErh0kLCfACVBcu+2tAUEhy0aL0a6ElUfV06NKV+FWCWKJlkclFwNFm9Dq3lUjpFNBcbbeUG2u0npGI7r/ZMZFM8mMxQpX5UCRRSCiYq1eNL9cwZDHevi7ydT185jKvFEuXmwDweHKt4v5ntUR7pCUHlc/uGtitPRTRj0S0EJrBLqvoI73WpvcNtt3g0qPH+QOMYFKGPyWWaMTZM8XV4uYeakOF7lotq1F9M8IZMGTb94MIVCZY2Rek6Kz3yMGW/S99EQcjeIHhLaxNJBbJ0HMsONm1BGvFXlTE8utWHAbxqAdLOLQL5jngKH5rTvqNCPbddF3lcn+AnXMHXSYkxmM58zgm8Pbtnfo+iGVJoHFZKgnLet9qPXKw/OEJ0v4sPGqPhmFB0DKt9DSHrDruTizQ5WtexTx6orvaJ/6Nd1Wnu5WijdpwHWzE90UOBo3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5769.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(366004)(39850400004)(136003)(396003)(451199015)(7416002)(52536014)(76116006)(83380400001)(8676002)(33656002)(38070700005)(41300700001)(64756008)(316002)(66946007)(66556008)(2906002)(66476007)(86362001)(4744005)(19627405001)(186003)(38100700002)(4326008)(6486002)(122000001)(478600001)(71200400001)(6512007)(4743002)(66446008)(54906003)(26005)(110136005)(9686003)(6506007)(5660300002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tGgSRrquywzG4Im2tQpsVK1rfk4QbR4Mu6dXQFgRO4TRxsS2IrJnzRFL7g?=
 =?iso-8859-1?Q?/1kH3fSR1hLFqF+KT2vasKbidYa5BRsjx44FLcW+L/CDobkUzbVzBxLaLd?=
 =?iso-8859-1?Q?M9QYK5JYRBWPzuqxdSMb2bDXd92SNZuvwlgZdrMwpbBP2LI6f4GCt4tIwz?=
 =?iso-8859-1?Q?vvZ2gJX5VQwKdjNJziLfSIfbwK6MeIDLLKUMqOE7jUaUMaUANMt2o5Xvp1?=
 =?iso-8859-1?Q?KV7FVFO4WFeYLWsb0RH+3bYM/CVxOc7FPqL/tq9Cw+W1fAp94t1Npc2Hct?=
 =?iso-8859-1?Q?QnYoSe13p9+PjWdmkUyv9RxcVgcAGcsZMN9lc7ecdxDqdTG+rcAyass1Lm?=
 =?iso-8859-1?Q?lWoXDYp2MF8fgkdvPK7x74nfIKwhcHMQlCecEgpqIWVKnCHof1iZsp033t?=
 =?iso-8859-1?Q?rd0JYmbW9YpAljR8pEkPzezb6Ngt/d/YiYjvJ/b59+d0mbK5RjU7tF07hW?=
 =?iso-8859-1?Q?eiORrKqmYr1irihvsgBI8DN2DfAl6ItUdEPsD2L3h2fcydUfDqfTEtFIOB?=
 =?iso-8859-1?Q?d5TbOzfu7QiZIwNRRLzlAWGf91hTOHPthc3W7apJA2+P0iQTamcBtBwWvP?=
 =?iso-8859-1?Q?NsoWPZp3tAzuy6RONb3sJc7yb5CIJMeXmgMcpwQulvnvjMLU53HvuN3ZeR?=
 =?iso-8859-1?Q?Sp+vFkKncbvjoSR+/pIwszUd5ZNs5dqdpwT5tCDgNnzIZuQ58Hqif2EEOx?=
 =?iso-8859-1?Q?oMrVutkRV4uILEgN1OM1H3B2QltIvLpc0CzibNL4SetIpV6l240ILqZ04/?=
 =?iso-8859-1?Q?T3o0Ode1PgC74MrS5wBfKSCzKuS1a8ldZizzRZX1KJiDoQuYDZ6d/SAHxL?=
 =?iso-8859-1?Q?t2h6za/IEsxH+9BnNVZSt6eY4kHbJGV0raccToai5V4uVsMrm2pz1D6C+h?=
 =?iso-8859-1?Q?BJdOm78UL0Sm10/UJI1sD9Cz/CHXO8XAtGZuFxpz7O2JphErTEophlJzRc?=
 =?iso-8859-1?Q?3Q0wlymz+nAtjDcPHl3WEHcuVCP+5zaUw4sNaoEcErD2GTZjLP4WxiykKD?=
 =?iso-8859-1?Q?sdZZedNOeP03eNQnzAwSnfSEsw0jMHUkwG2W/MaH3GuW8ZyGZZJqvy+fqn?=
 =?iso-8859-1?Q?w2uai3+m5marp5lUxcxPi8Lu0r4mpGfYnbG0s/uLmQX8UNUhRanm9tp5aD?=
 =?iso-8859-1?Q?IFYgV9QTBB3DAeAtDlffA0GAz8wCv9CvD//ffkyPlHFkMJiOU28JwHSbEZ?=
 =?iso-8859-1?Q?UNfhoE/IkDBIpY5CO+iN5jWm2E9RVgFIouLtxNB3D6Uja9L6dwdzerz4uL?=
 =?iso-8859-1?Q?IDgOp4/UZnzSgrJK+L8jicL0Nwjp9fZWoth0wpmE90LExtUrDYM7aK2klk?=
 =?iso-8859-1?Q?i3mF/ezyydpRkVzWLhePMmQ9DVy0HRwPncx1Gx3WE5S8AF3/XfrY/9qjGH?=
 =?iso-8859-1?Q?j2l2nm0pIwT0j7NLgAiR0OITLMA549qtIJX+KIXb5Y4dq3w/4EQaOU1svV?=
 =?iso-8859-1?Q?LK0PYj7HVZhAThJhon8j96cx2+cG2VtW48wVKU5iMkqFiennM3vsVIdICB?=
 =?iso-8859-1?Q?ObScSJ5LdTldVnCq7VBFNaicY7Gh2E9pkfDs6dq/wu5BijzdexLCAs+V7v?=
 =?iso-8859-1?Q?Ks/PbI2JOVJH95T3tkRqwgnYa0fLAg5UFpLwD7nWr5MaiLb8udtnpbmKKQ?=
 =?iso-8859-1?Q?m4ZgGNw/KRTWtm+HcVF6M026bHfnxpCbx2?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5769.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f180365-de52-48a2-a6c7-08daa0fb5e79
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 02:44:30.7988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h4BN7XTIpX7nuz4GD8UkgLvJ9T7F9P4wpmfEC/52gQrQoaxNiWfOC+EKI0wBPnLyEohak22vOpQ9cYiXdpmlbu1zBtrm+zmJv52pLpasXZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6092
X-Proofpoint-ORIG-GUID: 2d5lGlHdIPX4CUHSz35o8zFKhux4qTKH
X-Proofpoint-GUID: 2d5lGlHdIPX4CUHSz35o8zFKhux4qTKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_12,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=289
 malwarescore=0 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209280015
X-Mailman-Approved-At: Thu, 29 Sep 2022 08:06:37 +0200
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

Hi Jaroslav

When I tested the audio, I found that some registers in the codec of wm8962=
.c will fail to read in the mainline kernel. I found that wm8962_i2c_probe =
will enter runtime suspend after startup, but in the following program:

snd_soc_bind_card
     snd_soc_dapm_new_widgets
         soc_dapm_read
             snd_soc_component_read(dapm->component, reg);

There is no runtime resume, which cannot perform normal reading and writing=
 for volatile reg, because it has been switched to regcache only in the pro=
cess of runtime suspend. I can't find the right place to resume, can you gi=
ve me any advice?

thanks
xiaolei
