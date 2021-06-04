Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C6839BC7D
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 18:03:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 086D11731;
	Fri,  4 Jun 2021 18:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 086D11731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622822606;
	bh=RqN+tge85ppgwr+JqrLch1FvBesmMj5dlWo4NpFkexo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qBaK288fOLXMcDK5ZSzGvqcu9ifYZCNJGcNllJqs5tF3wcT7AXfm9qd0N9fMwCs3T
	 VuTd3QFJa5QL4kXvd0vO4baHA3c2PXncXrI2bjkCM7pz/Ch2Hb1MwJgoXRp8Yi/rna
	 jVtOnxxvm9+L/7lDPTyPvdfK2GSrvKq3BrEbgxDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2525F80424;
	Fri,  4 Jun 2021 18:01:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13BB5F802C4; Fri,  4 Jun 2021 18:01:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11olkn2034.outbound.protection.outlook.com [40.92.19.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 554D1F80103
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 18:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 554D1F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="P+KMeleq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFbOfwizYHLFvj0A5d/rKFpsmD4/j3FY7q9tjWLrA5Y7tq3ZbIRsgk1XMvGjlveqSu1w+OZ48dmDAV/IZkHul/BJ5Ule0d5gnFI2S122yi29aPjMJ/WtWg64n65LlHSlmuXyn6ioAtucDKvQlQI/6ewSfQadielno0gnXGVulZ2iNfNdzvEF245JPHiI1iEU4ZynbTVHbHVBWii8STTpHoXpdHbEOWmjj8aO7S+JPCQfvyhGB7slrxXdSbdDP8dwyKvj7jmuiYKEUzkfmH2jPF2xg1XoBfZn9LOahnqwiVyQKPUXB3xVPotlyfjWbG3B+wtSXZCtTokYOR95yY8cMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whDdlRcVOpE2b1SGNn9khPAtuERI6bttC2No4G8YSs0=;
 b=cTxabDxiDyNaTKfIAOuBLeezMpmn1MpUKrwN7hOCg+dND6XJHMXKs4Sfs59sMwOPPck013d7eKyseGbydCh/Jzl1RhvX2rPnSB7QfswRpRujq38phm/2CSQ+g6yvjS/7tn1gj/tUCSW3/KQxizI20nJ60QnPRh83YNCOF+2rIzwA6fF8Z1uj0k9UHYPxkYieTZ1Ofat521lyO1OxQ4mVAfKOltx4y/SMH5LrRIMBfKYv95m4WTI9yVvJqxQVU6lEwWfDjU+Nn+HymglqGJbi3PJn58wy7xgxr/eQfq13q5V7WlFNkKRz+ZE2Z+/S7C5tqHIzhf6gT7M1bfADHFnBng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whDdlRcVOpE2b1SGNn9khPAtuERI6bttC2No4G8YSs0=;
 b=P+KMeleqCAPxFF7GAVzeT08xDJ3vLDGTDbAFN1CK1fqys1/J5m2aZR4wWpsu7oLLENuvHYDK0/yoUZG0Md9aNqT2pxKKDa7irFrr5VrrQVbQdhxEVdT5haC+vtNrL0wZ07p8sPjv086eqPvXdTCSiA2cuWHPI7OXdXHLQdC0Jy5vPkZ0qsFklosk8fOx8ItU4YWBEM8VG+00bdY9jamciLnZq2tH0ht8le1s6gqoe9NZtATDb8WpecyNUwqle5pt91iprgKDP456Wos5xRekuJ0nGFc6K/CnbMlst7dSdG4LoQXbv+8yAsoTlRXMoXlNgCEjYCGElvfhM3clrgEliA==
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4b::40) by
 BN8NAM11HT113.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4b::284)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Fri, 4 Jun
 2021 16:01:44 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc4b::4e) by BN8NAM11FT032.mail.protection.outlook.com
 (2a01:111:e400:fc4b::344) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Fri, 4 Jun 2021 16:01:44 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:6B0D0EE37EBDF773EBD6A323F1A0280E7BA4C4A1043943742B550F4D73D55B22;
 UpperCasedChecksum:9DB00FC0546B9A4C7EB769B9A2A33CE201B7ADC079650194518816CFB9FAEC78;
 SizeAsReceived:7686; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::91a7:5b3:8e7c:621d]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::91a7:5b3:8e7c:621d%5]) with mapi id 15.20.4195.021; Fri, 4 Jun 2021
 16:01:44 +0000
Date: Fri, 4 Jun 2021 11:01:40 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][V2][next] ASoC: rk817: remove redundant assignment to
 pointer node, add missing of_node_put
Message-ID: <SN6PR06MB5342B6B6B21665F2E43CAAA7A53B9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210603113659.82031-1-colin.king@canonical.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603113659.82031-1-colin.king@canonical.com>
X-TMN: [1mTUANKZQBh0S2xaJSdsu8ZvPU9Q22V2]
X-ClientProxiedBy: SA9P223CA0012.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::17) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210604160140.GA19578@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SA9P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.23 via Frontend Transport; Fri, 4 Jun 2021 16:01:44 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 6c31f133-920b-4e40-7b46-08d927720cb6
X-MS-TrafficTypeDiagnostic: BN8NAM11HT113:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n8z9OVk/q17LgYrAcitlPozLEOxq81JOO9m1qaWexIS1XdXRvtArOqSrx7xgWownO3s6qCyrw378bO3dhw/Gr0zR+9KkoEIj533NI/sA7jRXOKhED52XAXNsaPMURvA1HID2gPRqFAMxty7EPsK7TlRt2aoPBCGq902ANO8meA/8oSqOsX7mQp2uTvNhDLckem3ZqKaE4nBdGrSIpToPBVPwpfCR9AYBa9cjZbriuoc6o5V33daD4jA0hwb4F4otE7qN5h5es0f+9IFoCFq1C26qiDFo3PwcblWE4adlZhPbh/hixE/a8SrAjJ9K3v2iPfsUz52X3beh8Y8fOuPouYjZ9ijg1CNaW3Xx4sPcAtAj2uy1mRUaT9BebmiyP/a8T+QggjiHddzaBrYt7z56zA==
X-MS-Exchange-AntiSpam-MessageData: 6zDjJg6pMNko7Qd4j6+072bmWjLCaSjXcukaki7Slwnil7eMb3XPD98Y0BE66rGvF3zJXPfh0UgB5cS1jzR/s6X/lhf+zqQhNLBMw+k7q1E9bXXmMNOcOuzOYe+eNgE5T15fFMKpKAil3UGv0EkXRQ==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c31f133-920b-4e40-7b46-08d927720cb6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 16:01:44.7583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM11HT113
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>
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

On Thu, Jun 03, 2021 at 12:36:59PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer node is being initialized with a value that is never read and
> it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> The function is missing a of_node_put on node, fix this by adding the call
> before returning.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: 0d6a04da9b25 ("ASoC: Add Rockchip rk817 audio CODEC support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Tested-by: Chris Morgan <macromorgan@hotmail.com>

> ---
> V2: Add missing of_node_put call, kudos to Dan Carpenter for spotting this 
>     issue.
> ---
>  sound/soc/codecs/rk817_codec.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
> index fd3a5ba034a9..a44d3cad1119 100644
> --- a/sound/soc/codecs/rk817_codec.c
> +++ b/sound/soc/codecs/rk817_codec.c
> @@ -456,7 +456,7 @@ static const struct snd_soc_component_driver soc_codec_dev_rk817 = {
>  static void rk817_codec_parse_dt_property(struct device *dev,
>  					 struct rk817_codec_priv *rk817)
>  {
> -	struct device_node *node = dev->parent->of_node;
> +	struct device_node *node;
>  
>  	node = of_get_child_by_name(dev->parent->of_node, "codec");
>  	if (!node) {
> @@ -466,6 +466,8 @@ static void rk817_codec_parse_dt_property(struct device *dev,
>  
>  	rk817->mic_in_differential =
>  			of_property_read_bool(node, "rockchip,mic-in-differential");
> +
> +	of_node_put(node);
>  }

Tested these changes and they appear to work just fine. Thank you.

>  
>  static int rk817_platform_probe(struct platform_device *pdev)
> -- 
> 2.31.1
> 
