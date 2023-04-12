Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C87D46DF8E0
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 16:48:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 970C8104F;
	Wed, 12 Apr 2023 16:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 970C8104F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681310892;
	bh=tCpfqOm91F9+d3d820Hn9Un7E47mHAi9jT2TwwzL7W4=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:From;
	b=llQ65XnAyrL3teCbuQnqzZIMOUSkRq18RU+i+AIvo7NydSyv/gQQPw7lsbNhgbq60
	 Q/SNX+mlo6wO/wc990c8SkmVs6D+5q2FJ/hX9mAZpcyNDO2W+OT1o6l7QUT2WPXBvI
	 oYYaJsdE0BKKnWq4X5sp4bqv2OxI2suiyRv6Lrx4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDBE9F8025E;
	Wed, 12 Apr 2023 16:47:21 +0200 (CEST)
To: Baishan Jiang <bjiang400@outlook.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: RE: [PATCH v2] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to quirks list
 for acp6x
Date: Wed, 12 Apr 2023 14:47:01 +0000
References: 
 <OS3P286MB1711DD6556284B69C79C0C4FE19B9@OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: 
 <OS3P286MB1711DD6556284B69C79C0C4FE19B9@OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSBKJEY57755BLRQWOJTRIID3FXIQGVP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168131084103.26.7232689866895095136@mailman-core.alsa-project.org>
From: "Limonciello, Mario via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 557CAF8032B; Wed, 12 Apr 2023 16:47:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2631EF80149
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 16:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2631EF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YUiG2IrM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fop3hkZNssQ7TZpWbY/PJdI5/4nlTzag+6hIaBe0KouqwZPwe3LV05EKnCoK55FRdPqRjHMEEkSYglsRhT1RbSXoJgVzeZHwXBp33taB6jkn+KzxWPSB3vHTx1813XO7kjP+jwdHpjLCO1ARAW1GVsHa4njUoM/77FQbdZL6xvQ56BIaTbdfMx7lehtj3Smfso+bvxa4Y7VillhIEjUTgauruJSo0L+gxNgs/f5CC2JJkESRFGjDgkVwfwRBV9fnt8ELlyT9UXfPsM89tCGGZbSe1JuY9o+9Ll0W42yMMJYLwziextae+3FrAuxNY+IrTZysz+YsqMODf6JeG51GzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZySwq+a0HnQCUfxWxPfCeNHh736bTgNn3jcEcl4XzU=;
 b=cReKlIVF0UJVb7IuVrxWfmxsjoFP2llCb9nwVF4p+uKqXjFtEIEqjrCn+GIUT7iYjPkzJVxqjRDODc2bKx8VJj/War+G34zyiHthJALRX3NkJVPRNthjX3hmupEHgxYuaM0FtbZ3RLfSFVe1K1sWMOdOIueFoQTrxLAiLcEzymqoWh89ax7GvRjes5VmmJoLPsuQEI420GDiYirP1g51HVY9cn//rD3yvhJzY1JQrtcSI6+J/rma1PtowebYxk0xARSr/2cR4StjXPp9ymhfvFc+R1xeZDwU1zizEXMSone82HIT9CEB0Bwv1ESJxMovJYX9ZrRKaDbTfUuNB8v93g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZySwq+a0HnQCUfxWxPfCeNHh736bTgNn3jcEcl4XzU=;
 b=YUiG2IrMsS0RUd6xxmWBXSsPsgouHPzEMISzgXEe6QY5TWqruqClK17TXg/ly6z33K8FJt4OGD4pf9RPpgWd0tacPthu6x+d3+SdltcgcFWkkGvVXOR+GB6iOAggp7Gy6QHeDOVWTbiJSZSmP40aw/2DUAk7Gga4+X0aUEl/UMY=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA3PR12MB7975.namprd12.prod.outlook.com (2603:10b6:806:320::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 14:47:01 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6277.036; Wed, 12 Apr 2023
 14:47:01 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Baishan Jiang <bjiang400@outlook.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: RE: [PATCH v2] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to quirks list
 for acp6x
Thread-Topic: [PATCH v2] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to quirks
 list for acp6x
Thread-Index: AQHZbRt5wxXeIJaS+0KmLy+xNuZVFK8nvi2g
Date: Wed, 12 Apr 2023 14:47:01 +0000
Message-ID: 
 <MN0PR12MB61013DABE036B5D1BB3518A5E29B9@MN0PR12MB6101.namprd12.prod.outlook.com>
References: 
 <OS3P286MB1711DD6556284B69C79C0C4FE19B9@OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: 
 <OS3P286MB1711DD6556284B69C79C0C4FE19B9@OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-04-12T14:46:59Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=61fb2d1e-8cb9-4b9a-a821-334c7aceca1b;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-04-12T14:46:59Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 
 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 
 ba074258-e387-4594-8a0c-db5d30e3f898
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|SA3PR12MB7975:EE_
x-ms-office365-filtering-correlation-id: 21fd28a7-18d3-4794-d22b-08db3b64c65c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 neEg8N8V4tEfZFmvJY68TVZCTNRfVzWSolqZPnJagPpmDvMcajdsT9eqpcyiQpjLbiBpm9KxM8LlSFycpnW3Oz1a5gGVjnHxmJs8q67+6uLf9WUUpKSRThS57nZPALXMKQ9tNOSndvK9DktAkM2bf+ZZRf4IyNdhRHxQDTPjIZYfigEvAPbgzUG9uIsyvj/7WrwUrPzUpWhiq+0EH3Wgp/WFgKtI7zqJReIxqvKvB3NecAAAfwU93Prz0u1ykdoxScXb/OsTuxHEvXLtQZgPEiL5Tg5/NE1ZqVYvvJ4UTQKkKJrnpNSPlYw8LXQox0JOHIHqlrEPg6fm7PjSaVMJz6METX5Cf3cj32L7YMXg1FcbERIFN1CyZFamntXUeSpwJANTxtWaTj67P+o0RVyuluYqcY55pieMFlJgbwzWMUTTOVX/7nfM92ZCeXjnilNbJOtndq6WVfJDGO5nXsJRjs5xMBi1FiHO/2EQtaoREBVhOmArFUmKg8cq35bylWdTp4jimkjXoRRCFaPIqg44l6wGAXb9hJfh7xijhrW1A9CLRO3SKzrauRvF4WMZPTFsp45s9+wnqvVSPtPPSiDgQTnTZQGnnlnLW2dfrBzdLYJrSdhoKSa++mp2MuL4ZPv0hCcDTp6vQnd9jrjYEYSsTg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199021)(71200400001)(83380400001)(76116006)(478600001)(7696005)(186003)(26005)(110136005)(6506007)(53546011)(9686003)(52536014)(2906002)(33656002)(5660300002)(122000001)(38100700002)(66446008)(66556008)(64756008)(66946007)(41300700001)(66476007)(8936002)(316002)(38070700005)(55016003)(86362001)(8676002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+pWuJsB5sp08RfNY075nfvbCbiF2xMfvl11ApL9FVLRPVDF9RKufA2Cta3Dk?=
 =?us-ascii?Q?D6oJmgUMVHH4iQev86dUAvVibCKMa0SM+Q6PXYp4QcnqtFAshPUx8QpX3eWD?=
 =?us-ascii?Q?Ixp2FThlGfVrRtlp6dITVj1EUm0+XWBvKvsR4mM/9uTfjmLtgZtwbGIuw2G3?=
 =?us-ascii?Q?gkHdd63ku25nizUwEesP+GGccARQ3cjRAhG4LIlK/cwEPOmkVyy9vLGxMwwN?=
 =?us-ascii?Q?t6ldvg8hg8bHiou7xQ9Fz9ZDOUwT3o9/ZEtGRd4rwTEW1TRlfGUW+CGvHHaD?=
 =?us-ascii?Q?6gpsnPZOaF8K5AdM6uNjFq05hSnwcm5vfZ6kePkYAX4hg212IIRPrPCTz8Bp?=
 =?us-ascii?Q?L2XfVnHwpMxek0vug8k9AVbHYLrRGiLSu2kQJfkNSazRMmoyHpnhzH1EX4a9?=
 =?us-ascii?Q?z6MX2UBsoYLM+qT+vDEmpYyWdOkIIKqqmt5g14v40GR9sRdjrw9tk4JfQJyR?=
 =?us-ascii?Q?wI8XOoYB4ECQ6bdhCdis0CBSqjTskDpF/k3rYBa5t0raIbYCMKYDVKUIQGd4?=
 =?us-ascii?Q?w9fUhzQeBh9VnAOnIYxO1ADWvtYi9hjEh3qPpeaaeC195r+0UeHhLIvAhyui?=
 =?us-ascii?Q?JMlq0s75OW+yiwy40iItz3LoAlcmliNrCJbAE6qTmk+8IjYzd56In98nHPaX?=
 =?us-ascii?Q?MqF8Y7kjbWSR/Lfj1RScsTKeddEaQJ4tfoJwUkIk3sYDE3DT+4eA6Z2feZFc?=
 =?us-ascii?Q?fP58FNqqu1ndEUU2HIsWLVuvSa9ud5//hIH/QKB1xRiyb+5GKqjw2f2xVFbl?=
 =?us-ascii?Q?VUl6mryMCsm/f0ZGxmiJg3CgzdNT8e+vzgwHYEtkFl54Ot0EuIeXfeOYEV2/?=
 =?us-ascii?Q?QlxAVCry7QQooLzU6MgOwWIMVkN1P5MU69vMjLKFJNAfVHnvJLB8L8PU57vT?=
 =?us-ascii?Q?aKT/U/Mj5JxZMIh7AfgT5IWH27or836I9LFeJEYgrdPFFPZS+UyBu/ltW2Rn?=
 =?us-ascii?Q?m1nSwbNWmaygdhhprqPU+c8F90iSZaWfj0BLYl6h3lMtRX35Ng38r+932g4F?=
 =?us-ascii?Q?n9oieNDQibAEF8bmaX0TpcddXmiMqRmAxb/f1bAApZ1kJNR7rRAH6kIaGFbk?=
 =?us-ascii?Q?6bqZIcG755i/GvX79IaiA/kkH/IW1Rmlm6dzVbxDQQa12CFTkhP/BzYgUUFH?=
 =?us-ascii?Q?dj1n1D3kReUXGaaPUjZpdRbJqXjA4cJxJG74DBeb9NA6m9LWplVuW7mfr2H5?=
 =?us-ascii?Q?RiwgHqfTg3ACBBRwgz0yQ0/foXWuzYkJLHomnH85KzkIDnelqWjffFnFq5hC?=
 =?us-ascii?Q?xv6NDEL2Cptuiv/RDaIKNPo8btd/sxYFI8kZ0WaGr7HvaYb3SsUNE5fMPt8u?=
 =?us-ascii?Q?Ymd6gECbSKEzw4MrDAUQIBE1Bh0VW9o0hHNFtqqqkkM9Ftf4CWthAD+/sUYO?=
 =?us-ascii?Q?0VZIFtQdJvL9KmNuIkbNQDeYZVzTQeNxz4jqgff6PyJ2Vc/x5XiBUYbwjYEK?=
 =?us-ascii?Q?odFUV0P984ObuN7s8BzVcvJhvq9E7ofae5+n1+l5sRsM2hs7fezUDvQ6zGns?=
 =?us-ascii?Q?2oy36q/PRTC2/IW1NqwTzGb5He8q4wX5pafQTDK4ZMaSGUQtVELTgFhTWDAR?=
 =?us-ascii?Q?ozlO+zwWIh7bp3GlbV4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 21fd28a7-18d3-4794-d22b-08db3b64c65c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2023 14:47:01.3535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 oZoNFnxHSGjm2Cu3jayY0ZDtfEDUWDhUBhBC4Dpv+jfiqlBuy2yfl2kmgx3n1In2zqgPLn4kRo5oF88ZSQ1Zxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7975
Message-ID-Hash: 2YZP7JBIBRQA27PVCTI5B4L2ELYESVXO
X-Message-ID-Hash: 2YZP7JBIBRQA27PVCTI5B4L2ELYESVXO
X-MailFrom: Mario.Limonciello@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSBKJEY57755BLRQWOJTRIID3FXIQGVP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[Public]

Loop Mark Pearson from Lenovo for awareness.

> -----Original Message-----
> From: Baishan Jiang <bjiang400@outlook.com>
> Sent: Wednesday, April 12, 2023 03:41
> To: Mark Brown <broonie@kernel.org>; Takashi Iwai <tiwai@suse.com>;
> Limonciello, Mario <Mario.Limonciello@amd.com>; alsa-devel@alsa-
> project.org
> Cc: Baishan Jiang <bjiang400@outlook.com>
> Subject: [PATCH v2] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to quirks lis=
t
> for acp6x
>=20
> ThinkBook 14 G5+ ARP uses Ryzen 7735H processor, and has the same
> microphone problem as ThinkBook 14 G4+ ARA.
>=20
> Adding 21HY to acp6x quirks table enables microphone for ThinkBook
> 14 G5+ ARP.
>=20
> Signed-off-by: Baishan Jiang <bjiang400@outlook.com>

It would be generally preferred for systems to start including the _DSD in =
the
BIOS so we can stop growing the quirk list, but if they don't then patches =
like
this make sense.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
> V1 -> V2: Fixed signed-off-by format
> ---
>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-
> mach.c
> index 0acdf0156f07..62d8a8e060d2 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -178,6 +178,13 @@ static const struct dmi_system_id
> yc_acp_quirk_table[] =3D {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "21EN"),
>  		}
>  	},
> +	{
> +		.driver_data =3D &acp6x_card,
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21HY"),
> +		}
> +	},
>  	{
>  		.driver_data =3D &acp6x_card,
>  		.matches =3D {
> --
> 2.40.0
