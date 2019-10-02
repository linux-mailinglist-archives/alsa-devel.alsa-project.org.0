Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4AAC4937
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 10:10:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B19A5167D;
	Wed,  2 Oct 2019 10:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B19A5167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570003854;
	bh=XRzDQsg9AmyWvPitzwZbWKW0HtN8II7mV1dQXnV3qjY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S/Oo/hluyBvyaYZJ6mBw4Ea7YzzldxEEzZi/Ht8EM7fnHhVUivbL3FLGbOpx1+TXt
	 KSTOMHDPD0kMJ7U+4AcNS1x7OJGg+/vsWg2UC7QI/qm7rz0C4O/P/IM6p/l6dOKm36
	 dPz4CEf+NMQIK2f37mlyRNo/a2XqYj6wWueYo8U4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 433A3F80391;
	Wed,  2 Oct 2019 10:09:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06F29F80391; Wed,  2 Oct 2019 10:09:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63787F8036E
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 10:09:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63787F8036E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="VQBE6RUV"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x92885SC027752; Wed, 2 Oct 2019 04:09:02 -0400
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2059.outbound.protection.outlook.com [104.47.41.59])
 by mx0a-00128a01.pphosted.com with ESMTP id 2va1c949yp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Oct 2019 04:09:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SE8EMSvE4W3SytNJF0aUG64855+1x+nv9awwMcfEAdlNwmmOAjigEy59yW7GEOe5nTvCkswPBLPNDIlg9DDHBY21iLEZqDnFHJD99SIQzTTnn0NxW+bxwLy++rrHbzurPgJErFl+eZyHJyXaaLs+jv5gTYWrSVj7y6/Q6L6kNuvJBWrdECKHHaNq58qPkrTTXGphPBaEgeTso7W0RfhwadDtBQ4ukfOHcQVQNTAzoAH0TxQDGIdDA1IhRgR9+fRe6b5vCQ4iDZQcURKslhVfvZXKdu0aGdaW8H3tdiN3CvcZmU1BECO71vd2ypIbsiqV7TFmAfjeNdHZLIhl8ocGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BCNbydVJNpbFVbh//axpWKleRO/qQT3tTj+Ftwga2c=;
 b=IKOPV/8PPUIhVQ2Pzrr/CkbUMuSKtOcJTieh3Al93onqKzeWJu+xCE+tcgDCJ58dpJ949xTvyFk0wfy2fc6ndGF9pyynS9kZTQs11oIhKFTs7ZbGFUtHALvJ0KLSdWKrTgQcBHbbBXdAp7zMMp+mo8HyQEym8BgAXQIf+6njB5Vz+omURMLAeIJrn413bnfDFoK/BhrJvLBu1xWY1xxWZWqjmjEVHhhMi99lczpsuYhGyBZto10lHWK/bqt55GTDMNFcP+3trWTMSCkaYD8h5YMZVnImVUzzk4QipGXg97TWdl2OtMkFzzthGJe1U9ncr1C53v4BmyCWZMS+0ukXOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BCNbydVJNpbFVbh//axpWKleRO/qQT3tTj+Ftwga2c=;
 b=VQBE6RUVczemBfGIEJaY3Y9A4iMSB/BCYIaOrjlJyNoPFR+2zFvB46/n7z7vlq537gbId4PTj6T4xiloacc8Lcxxgssm/tnYCJi/lCs+L+5BEIXxO85RdmhxHM1Ej2YmLWtywqBip7wLonUdvPTE9nX/V30xuY1o95ECDHWAszY=
Received: from MN2PR03MB5117.namprd03.prod.outlook.com (52.132.171.137) by
 MN2PR03MB4751.namprd03.prod.outlook.com (20.179.83.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 08:09:00 +0000
Received: from MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::6006:4c13:a8c1:b359]) by MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::6006:4c13:a8c1:b359%4]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 08:09:00 +0000
From: "Sa, Nuno" <Nuno.Sa@analog.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Thread-Topic: [PATCH 1/2] ASOC: Add ADAU7118 8 Channel PDM-to-I2S/TDM
 Converter driver
Thread-Index: AQHVdJpKDYg2bk+VvkSIGNv9o2+YhKdD/hYAgABbZACAAq67AA==
Date: Wed, 2 Oct 2019 08:09:00 +0000
Message-ID: <d3d406312a7b66f7d373b509faaab305adb8af36.camel@analog.com>
References: <20190926071707.17557-1-nuno.sa@analog.com>
 <20190926184318.GF2036@sirena.org.uk>
 <6245f99f37c10dcec0a52344bab4b980f08e07da.camel@analog.com>
 <20190930151132.GA4265@sirena.co.uk>
In-Reply-To: <20190930151132.GA4265@sirena.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2e1b738-5033-462d-24db-08d7470fc85d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR03MB4751:
x-microsoft-antispam-prvs: <MN2PR03MB47512FECE0D2B3EC2567A1F4999C0@MN2PR03MB4751.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(366004)(136003)(346002)(376002)(199004)(189003)(99286004)(2906002)(5660300002)(2351001)(486006)(6512007)(229853002)(6486002)(6436002)(4326008)(86362001)(5640700003)(6246003)(256004)(118296001)(14444005)(8676002)(305945005)(1730700003)(81156014)(81166006)(102836004)(7736002)(6506007)(71200400001)(71190400001)(54906003)(36756003)(76176011)(64756008)(26005)(66476007)(66556008)(66946007)(76116006)(66066001)(8936002)(91956017)(66446008)(2616005)(25786009)(316002)(476003)(11346002)(2501003)(446003)(6116002)(14454004)(3846002)(6916009)(186003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR03MB4751;
 H:MN2PR03MB5117.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pjLSHBJvU50DcMIbkguhK+wDquTQl6OiYfLTuPr8tbq7UW7yJizOxQl/lNj0yZ++OEIZob0xnqlG/lHQJg7aIXRqV/hTx5vpN40a8NbrsA2Ovq9EX2rh6qYuhzmWwN6bYrafb/R24gLAST4g4m4Dkq28JUOCHFZ0rTQoOm7yA65icZR5WITZQYvzLQhphYbW8hh3D2ZE68lOc3td4VCBYssBpIhsyO1Y+cc5tOwtj7HzKQPVT6ALKe5IdKJTgLIo4/ThXlOxptbLNjSwSEa5V18X69FiOoM2beq85rX/45hvlEsP3vlS+PVuzw1cvKwMMVx7Y85Lysuz1c5pCkSZMQ9Yi7D8RnufCOGN0NbAEwVLy7TI42R5L0BxJzAGxffVBj/a8zuDPEfz+Bvu5f7+FU6aq6UFO0GYeDP4T45yqy8=
x-ms-exchange-transport-forked: True
Content-ID: <9D81B9BF81E81044B19DAE2DB431C1A8@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e1b738-5033-462d-24db-08d7470fc85d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 08:09:00.6942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VF7XqgLQ9tgta5imWgmLGgd7fuHYqXeUmM3bWHptAxRqhJQevMB4XJGlFODmpPfDUubO2Mgd1FZKzowWlnVoLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4751
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-02_04:2019-10-01,2019-10-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=847 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910020077
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/2] ASOC: Add ADAU7118 8 Channel
 PDM-to-I2S/TDM Converter driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 2019-09-30 at 16:11 +0100, Mark Brown wrote:
> 
> On Mon, Sep 30, 2019 at 09:44:00AM +0000, Sa, Nuno wrote:
> > On Thu, 2019-09-26 at 11:43 -0700, Mark Brown wrote:
> > > > +	case SND_SOC_DAIFMT_RIGHT_J:
> > > > +		st->right_j = true;
> > > > +		break;
> > > Don't we need to set any register values here?
> > The register set is done in adau7118_hw_params(). For right
> > justification the device can delay bclck by 8, 12 or 16. So, We
> > need to
> > know the data_width to check if we can apply the configuration.
> 
> OK.
> 
> > > > +	case SND_SOC_BIAS_STANDBY:
> > > > +		if (snd_soc_component_get_bias_level(component)
> > > > ==
> > > > +							SND_SOC
> > > > _BIAS_OF
> > > > F) {
> > > > +			if (!st->iovdd)
> > > > +				return 0;
> > > This is broken, the device will always require power so it should
> > > always control the regulators.
> > The reason why I made this optional was to let the user assume
> > that, in
> > some cases, the supply can be always present (and not controlled by
> > the
> > kernel) and, in those cases, he would not have to care about giving
> > regulators nodes in devicetree. Furthermore, the driver would not
> > have
> 
> Have you tried doing that?  Notice how the regulator API subtitutes
> in a
> dummy regulator for you and the driver works fine without custom
> code.

Ok, got it. Looking at `_regulator_get` I can see that a dummy
regulator is provided, when `NORMAL_GET` is used, even if one was not
given. So I think I get now the usage of
`devm_regulator_get_optional`.  As you said, supply voltages are not
optional, the optional _get_ should be used for things that are really
optional like some parts that can use external vs internal vref.

> > to care about enabling/disabling  regulators. Is this not a valid
> > scenario? Or is it that, for this kind of devices it does not
> > really
> 
> It's not a valid scenario in driver code - the driver shouldn't be
> randomly ignoring errors and hoping the errors were deliberate rather
> than indiciations of real problems.
> 
> > > > +static int adau7118_resume(struct snd_soc_component
> > > > *component)
> > > > +{
> > > > +	return snd_soc_component_force_bias_level(component,
> > > > +						  SND_SOC_BIAS_
> > > > STANDBY)
> > > > ;
> > > > +}
> > > Let DAPM do this for you, there's no substantial delays on power
> > > on so you're probably best just setting idle_bias_off.
> > So, this means dropping resume/suspend and to not set idle_bias_on,
> > right?
> 
> Right.  Like I say it looks like your power up path is fast enough
> for
> this.
> 
> > > > +static int adau7118_regulator_setup(struct adau7118_data *st)
> > > > +{
> > > > +	int ret = 0;
> > > > +
> > > > +	st->iovdd = devm_regulator_get_optional(st->dev,
> > > > "IOVDD");
> > > > +	if (!IS_ERR(st->iovdd)) {
> > > Unless the device can operate with supplies physically absent it
> > > should not be requesting regulators as optional, this breaks your
> > > error handling especially with probe deferral which is a fairly
> > > common case.
> > Just for my understanding (most likely I'm missing something
> > obvious),
> > why would I have issues with the error handling in probe deferral?
> 
> Actually it does look like you handle this correctly further down,
> the
> normal pattern would have been to have the error handling inside the
> if
> here and not indent the rest of the success path so I misread it.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
