Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE60398C12
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 16:13:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDE0C16F2;
	Wed,  2 Jun 2021 16:12:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDE0C16F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622643203;
	bh=+LsPoqaBIWId1DNfdEhjmCxWyGNDCogQrFnuIXwcl5o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JMZnQiMGWvDxi6U0cfKc4xQGeP6lGUJaK4XAwMr0+UP54T4xAxK2B2Xt6MuLKFyi+
	 VsQGcAiZJ3PAofeHjHR4m8jT2wTlloZuEGhYbEnf/Apv6nLZCzM3PIv6h+irqm2J1/
	 r65LsOe+WhedqH6dqhskNwbflx8tw57uzHmPzUlc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C044F80425;
	Wed,  2 Jun 2021 16:11:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98DB1F80424; Wed,  2 Jun 2021 16:11:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2012.outbound.protection.outlook.com [40.92.41.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ADBDF80273
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 16:11:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ADBDF80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="e5l6mNEC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzyN8yqUKm1+Ybf08a71eSSuqtwHD5Al9SakE2yUKMoQB7jRjTjcMmD88zng9tCVdlZoQac2bkRw8CQsdTwpLar+p1ebC2NrmC+xgJ4Jl4NI5oQwmEZc3h1Xhv55ScXye1IpTEYezQdnDrhB2qWpDXBHDYVlnmVEcdrRyBUknHTqimxFrDNTC/sUKug5qz78uH3NCmcI1iqukOMbO/m57cbL3oASes2EmhXwHR/WRRfILtxpXe5D9dFcdp23WSI0pITYJ1I58fc7Za5dtg1+64pk+DclfBLmXhkr2fjBOe9cZfk4G6VsP71IUpQ5Q3fFGNmBD8uqVxTAmsLjzUu8iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aq0QvJNflos3aJQtE7G/ljc8vHC6i626kF+eSGP0eOs=;
 b=L6emGLKM7CO59WKA9MUb02cUJ7j/vFeGj1buW0Viuc1mby1RIiw/uUwRSE0yGM6BwZtiFDXMDiSHzfXOuPvMISKJpxd4AkRIKxTQXCCbCekA6xEjNpJ6er+zfPV4Glq+vmObP118VrQUtrJm9tScpJHkiYPgwAuQ8X7NwbFNV1XkyMy0jb2FZX6bVozSYiP0UPvv2IGfMlieXgYwwqLp1nbnyvw3eb4M4kVLMMiHsa4GncMli/fmmKPT2zzv1wpduYUYWIQmXDpNpjXYY4TGBSCOyApViSjsoVOswjVA4ghVamdipdvBOQBxMxLx2h/lUi+5Facv3IAdKeJuO2tzAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aq0QvJNflos3aJQtE7G/ljc8vHC6i626kF+eSGP0eOs=;
 b=e5l6mNECMZxNATJZJBTCGwTg50PmFLKZ5u7XqlPokEbbhNdxrzAQDJb5PwECBs6ScVD1rUcf5PYnQBHAhLrK5g9OkmSUNOzoioQDDYxsATxIoOzKztqyWasXbcByj86bN7MQDBC4JDtt4rJCP+3i7z5yBLnhf7B/BLBisJqgoCVnAfrbD9DoFFTAdJCd599YXGS1k67sX6RyLY7UVRkXOwtdSAL1uprBoI6vebe5cjUVBr860Q6UjTGwk8UqCDOD8laogPVidftQOcn+1/FyFTO/qUMLL2gsPnd5OD//Dr+3vQnPY9mwGyRfRhzE2dYGy9DMUjf0fmAaaRur5eGVSg==
Received: from BN7NAM10FT025.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e8f::47) by
 BN7NAM10HT008.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e8f::144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.28; Wed, 2 Jun
 2021 14:11:37 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e8f::4b) by BN7NAM10FT025.mail.protection.outlook.com
 (2a01:111:e400:7e8f::100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.28 via Frontend
 Transport; Wed, 2 Jun 2021 14:11:37 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D5D855A4AE7747BAE69538F574C08AB1C4C425CCAA543029541C8F1528E9E7E1;
 UpperCasedChecksum:60D1322ACD4C2F5F71AA603E22614B9A8DE40356F6AE487D6BD1C0AD2EE15E2B;
 SizeAsReceived:7717; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::91a7:5b3:8e7c:621d]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::91a7:5b3:8e7c:621d%5]) with mapi id 15.20.4195.021; Wed, 2 Jun 2021
 14:11:37 +0000
Date: Wed, 2 Jun 2021 09:11:32 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH][next] ASoC: rk817: remove redundant assignment to
 pointer node
Message-ID: <SN6PR06MB53422078933011A94E724EBCA53D9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210602102746.11793-1-colin.king@canonical.com>
 <20210602112416.GG1955@kadam>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602112416.GG1955@kadam>
X-TMN: [5sR+Jl4WGXDpwrHfJhDracmaE4uDZP4j]
X-ClientProxiedBy: SN4PR0501CA0149.namprd05.prod.outlook.com
 (2603:10b6:803:2c::27) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210602141132.GB11588@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN4PR0501CA0149.namprd05.prod.outlook.com (2603:10b6:803:2c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.9 via Frontend
 Transport; Wed, 2 Jun 2021 14:11:36 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: d4e533a1-6d22-4e52-17ac-08d925d05589
X-MS-TrafficTypeDiagnostic: BN7NAM10HT008:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N4hbXRUb0HS/ROh8Jp4Ig14mWSracoKr4Ysbgs0ogvkAiuN4o0R3GlwA1poak7/54yWKaqovYgzCZUI80cdBIMdmrrAC4xtzeHBoZRgIKoSmYXeHe9s6MmzyuD/th+QWN09zbC8h4Y9UhdV9Mibv70jssetW8j1TWTE+ueUj6oAe1NJhevFlV/bWVgbzwJJC7X55WC3d7EgOqNbJOdOB96KI0AueWNFksWuLC8gWlOOXSJX8R90CRFL2s2KywZASCjzU1xPFipFi7qEftYydx1kg9aGQvKa9X05j/I1xqSe5JBP1gNFDJ/tJfHgmg1YgSjxJUTue1nk5vGLqDupMK3C7vxXk8Ptan6w9rjVTl9cSKlDMFcL1OSdf/raKz7p+t6A2VGDINoJDd+oYya0p/w==
X-MS-Exchange-AntiSpam-MessageData: V5jSxHUpjnaMXZNNCjaIlFZ1du4pjZ8MCpjW5K1ERpK/G0s2kruux7Hu3aCSSQKIXREkHEPlz8jqc1WZy1DVQ4g6gwrLlTcp44qoZKeMq9+NOWkhJsAXqcjZbQThIa+7QCV7BGAZI6fd3iz4vVhZow==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e533a1-6d22-4e52-17ac-08d925d05589
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 14:11:37.2226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT025.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7NAM10HT008
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Colin King <colin.king@canonical.com>, Lee Jones <lee.jones@linaro.org>
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

On Wed, Jun 02, 2021 at 02:24:16PM +0300, Dan Carpenter wrote:
> On Wed, Jun 02, 2021 at 11:27:46AM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The pointer node is being initialized with a value that is never read and
> > it is being updated later with a new value.  The initialization is
> > redundant and can be removed.
> > 
> > Addresses-Coverity: ("Unused value")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  sound/soc/codecs/rk817_codec.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
> > index 17e672b85ee5..0d7cc26ded57 100644
> > --- a/sound/soc/codecs/rk817_codec.c
> > +++ b/sound/soc/codecs/rk817_codec.c
> > @@ -457,7 +457,7 @@ static const struct snd_soc_component_driver soc_codec_dev_rk817 = {
> >  static void rk817_codec_parse_dt_property(struct device *dev,
> >  					 struct rk817_codec_priv *rk817)
> >  {
> > -	struct device_node *node = dev->parent->of_node;
> > +	struct device_node *node;
> >  
> >  	node = of_get_child_by_name(dev->parent->of_node, "codec");
> >  	if (!node) {
> 
> This function needs an of_node_put().

I've tested this with the removal of the redundant pointer
initialization and addition of of_node_put() in the "if (!node)"
section and it looks good. Once you make the requested change I
will provide a tested by tag.

Thank you.

> 
> regards,
> dan carpenter
> 
