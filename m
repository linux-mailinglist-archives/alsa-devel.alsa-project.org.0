Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF92C10A2F5
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 18:07:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FC5F175B;
	Tue, 26 Nov 2019 18:06:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FC5F175B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574788020;
	bh=qe6aOebxmF01+npzu9KNdZwcAZhQzfsgKMo5M/+iZSo=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m3IiRToO6piVOKtSwq4Xqxxl0Njd1tO1EfHiupXGb5Xx1x1ZluWWwPGXlHA5TOPLQ
	 h3kkobqXrve8vjToAAvlyQX6NhTK2h/sMzRM3Da45l6pfJB4Tq5A3TdPWYEA4yeCNo
	 5DVU/IGS9zp0npUldmxc72fhBfayAFHPMz2lDxpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F07DF801F5;
	Tue, 26 Nov 2019 18:05:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6A72F801ED; Tue, 26 Nov 2019 18:05:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92868F80109
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 18:05:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92868F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="EfY/OBOl"
Received: from [46.226.52.108] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-6.bemta.az-a.eu-west-1.aws.symcld.net id 22/97-05312-06B5DDD5;
 Tue, 26 Nov 2019 17:05:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSf0wbZRjHeXvX60GovpQiLw1srrI/hlyhuCy
 H2XQKxv6hyBJJgFnxGCdtLEftHaw1iw5kZuV3onMM+dFNREWJDEYCTCV0iEDkhy1ER0YctGaD
 jTjAjA0nsdeDqf99vs/3m+d53jcPiakWCQ3J2gXWxjEWLRGGm5JkNJV3dN6Y/NtaAj3zs1tGn
 1nwE3TPZLWcvjtzWkZ7B5oI2jlQJ6fnb2XQXRud4DBp6FovJwx9823A0N84rzB0dzgJw/cr7Y
 Thm0uzuGG9e1emIldu5vKL7W/ITXdnaWuVwj6+OCQ/Ce7JK0EYCeBnGLo4MiqTxAiOrngWtkU
 PQH/V3CdEgcNRDLX1uzBRqODHMvRT9QNCEgsA1bV+oKgEoSQBafTh6PWgoYZLAM32NQTHYHAV
 oOFrk3IxFQmfR52nvYEpZCCVhprGzWJZDVOQ98e/gcg43ItmT12WiayEDCr3DAZZBU+gyUutw
 TahMB0NXfkumAcwDv1Z9hUmMgaj0Zy/NZhHEKK2b6cwiaPQkm9LLuVZNFb+K5DqiWjiF/82a1
 FL8/A2xyFPa9U2v4ycNQ3YTt7lXcYlplFb1SlcfAqC8WjL7ZDKVtThrCak8l7kbaekcixaHpo
 Kfi+CPjka8kzL60FS43+2ljgw4fIaIfGTqP38Lawx+BMRaOycH3cBvAPQ+TZzoUkoYswWSp+c
 TOn1KZQ+dT+lP5CsY96hGB1bQh1neYHS65jjvI53FB2zFOg4VugGgXMrsLpdfeDM2orODWJIm
 TZKeUQxb1Q9kl9c4DAxvCnPVmJheTeIJUktUk7nBLwIG1vI2t80WwJHu2MjMlyrVlblBmwlb2
 WKeHOhZI0Diqxfar6AqXCumGM10UpMDEExZCrhHrbYOX0PiNNEKkFISIgq3MraiszC//1lEE0
 CbaSSFruEmznh4aTlwBKywBKyc3PiEgLzr6U5KUu8MXgYDGZ9ERKbvf55c2/21xkvfDlz03/w
 /vQf6ereyUOtOLbHcZto0oYfirDPnddmPRrDNXyC2Tdvbrzvc8XbE5wjH/mMTp7KqIMTm3PPh
 g3U754q7U3EclKT7sw92N9ZRVn8KSExpbefi3si+93co3eWnupcWZnWVdjLNBvOrdW4t+vULT
 fGCnsyyw7aGtaFq68YHjMnG7DVtPeihOa80Mrd+7oyIUNXCPzVs03N3b7pghfdxnupx1biF9P
 IHId616sL10q9TNbjr3EvXTzgrT0bVWSsGKzL/vStiR+431s46wlX1vDi05vPIEVN7VS/0PH6
 PsGxpza91qeMue7R4ryJ0SdgNp75B9sekfd1BAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-3.tower-272.messagelabs.com!1574787935!781!1
X-Originating-IP: [104.47.2.56]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5515 invoked from network); 26 Nov 2019 17:05:35 -0000
Received: from mail-db5eur01lp2056.outbound.protection.outlook.com (HELO
 EUR01-DB5-obe.outbound.protection.outlook.com) (104.47.2.56)
 by server-3.tower-272.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Nov 2019 17:05:35 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMRETXGDE/mGT/B19QQI/N0zGkpqq1phioNk0e/wzE6lgpFgjqbpzCfQjT2+KlENreSqboFJtZzhxMaRoCZ+HbB3EjrcuwH6lrmeH/OYYKSOsewZ040AkIPP0jc11UrLq7zTsWf1n8OMkV1IZ37n1Bkd1pt/4bEdzbCT0nSHtEfMOl7YMW+6+QSBkGWhLTSx/UDDHqatNdf43udMb8KFRom2Qg3ScRyCIFmZlbKiI1isC1abcRww8A2+INm9lKzzV5R5fWH63Jg7EbfxPmyS0kCleHQ6lHgSt+AR/aJFoGFPtYRW8veYWAvnq8Wp/w1feSw66QEqDNb/Wwy+qL2cvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ljmhcn1J2mLKTCkAMF5DWYK2knem6+UE0h80w6JgrU=;
 b=QZ2TyrGRILmQhKFd+BG8B6mUXcxa2//+QhDTiBs9WsYe3KXNsRF4V7oXrLO5ihV4bQlbz9JnmG2OsyAvPCZBAd6QwsK2nVem+er6RqhDeKnzSTeUBjFVj6U+WbmtyawQ1vDNBILLxs6FcAWfQmMQetuclFeuIzlQRr6wR5MtPw+Ofeac1ufU6QgBTmDJQ/PtwCJJM6ufTq4FhdGeMCXWk5TDoQfiH/8fQGp4NGSTzZVa1996nBuvR9qWhvyEnFxuD0nNBxbjPembTR6VzlwL7fw7y216cX7lgxE08DQeHlFJ0nmAF07oCocBHwXwmA7SJqh9ztsgDyXHb4mM90h1rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ljmhcn1J2mLKTCkAMF5DWYK2knem6+UE0h80w6JgrU=;
 b=EfY/OBOlNPYZMvMfWcA42oYCTMbty+Q5uoCAVfcY8s6qeRlX8lUhzngDlj6GD9rA3zgxNqmcZOKk0e0Tv1yTFrGrwLGwto3lrB1rF7l7T95RlOd1so4VklakOQSevoE44cQyE4oqQ1twJhb0wQoBmUmKSai0Oc/13G53zQLgwTQ=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1170.EURPRD10.PROD.OUTLOOK.COM (10.169.155.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Tue, 26 Nov 2019 17:05:34 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 17:05:34 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>, Support Opensource
 <Support.Opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>
Thread-Topic: [PATCHv2 3/6] ASoC: da7213: Provide selectable option
Thread-Index: AQHVn7aW3HRPJHTGr0K/Z65q+crSuKedt65g
Date: Tue, 26 Nov 2019 17:05:34 +0000
Message-ID: <AM5PR1001MB09942FC6CA1144DBC8C7BC2A80450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
 <20191120152406.2744-4-sebastian.reichel@collabora.com>
In-Reply-To: <20191120152406.2744-4-sebastian.reichel@collabora.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02fbdf9d-9b66-4787-481f-08d77292da1a
x-ms-traffictypediagnostic: AM5PR1001MB1170:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB117096CC86F7756B4F49DDF1A7450@AM5PR1001MB1170.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:569;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(346002)(396003)(39860400002)(136003)(199004)(189003)(86362001)(52536014)(6506007)(55236004)(71200400001)(53546011)(26005)(4744005)(76116006)(7696005)(71190400001)(6436002)(64756008)(66446008)(102836004)(9686003)(54906003)(25786009)(110136005)(55016002)(446003)(11346002)(8936002)(2906002)(186003)(6116002)(66476007)(99286004)(66946007)(3846002)(66556008)(5660300002)(66066001)(33656002)(6246003)(14444005)(256004)(74316002)(305945005)(7736002)(8676002)(81166006)(229853002)(81156014)(76176011)(316002)(478600001)(4326008)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1170;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O5RcapkVKAKS7NqCRiR/4F7zHnSRppttCCOPmW//D5KQJgNBL+UNJFiqw3xjkKYGmnlbTjzAmwaKr/WFtgUfdMWrFOVAsYWz2cGz4fJ+9Dx8IBDxWOfiQqWjU+trBi58K7jzM85u7fShtxFWLL6KYYOhYQEpfeE12x35RQXbTIwLB/nWVf9DtWj7DK6IQ8xGZullPRFN3DT4AJHw7XlawNr7L0bkLuu6LzbsGFfbdwF/dHzUdPHhZiwXSnVIAv2iamLn86LNaM7I07z2eZLUtLbeZu31ylIAkRM1K8Qj9xsGe2+GQn4zZWXJN9pPC1d6IaGp4YLJw0G9+cFybM5XmKyf4OGgwCxFAGAXxLPAVFr0eSowV8rn7B1ru/1Vg2qi80T0VNWx7OJZVRDKVRstgeL2t3XF1WS4Liq3goJxwC9JdYI9wQ2LD3e74ezeV09j
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fbdf9d-9b66-4787-481f-08d77292da1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 17:05:34.4912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ofwMV23JbsEbvcQIDdXH859b8GBpAoDp+IIVLkDWLwg97FwNDsCN7jIQLU71xY4j5d5KZdroFbQDqzBgBlZ0zomYIY8lEw3DmyJ8PGK5/1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1170
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kernel@collabora.com" <kernel@collabora.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCHv2 3/6] ASoC: da7213: Provide selectable
	option
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

On 20 November 2019 15:24, Sebastian Reichel wrote:

> This commit adds the Dialog DA7213 audio codec as a selectable option
> in the kernel config. Currently the driver can only be selected for
> Intel Baytrail/Cherrytrail devices or if SND_SOC_ALL_CODECS is enabled.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
>  sound/soc/codecs/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 229cc89f8c5a..1d44fbc3d407 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -646,7 +646,8 @@ config SND_SOC_DA7210
>          tristate
> 
>  config SND_SOC_DA7213
> -        tristate
> +	tristate "Dialog DA7213 CODEC"
> +	depends on I2C
> 
>  config SND_SOC_DA7218
>  	tristate
> --
> 2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
