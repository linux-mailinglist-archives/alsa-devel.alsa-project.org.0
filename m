Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 321A723C61A
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 08:39:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D0BC1668;
	Wed,  5 Aug 2020 08:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D0BC1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596609588;
	bh=DW6XAqxixWO0JjeRxLrZEXW4FdVoGnbS6Q+0+3RGJOg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tbGIerF/CFy3MjEVtHbCQHT5hwyYPuHe+F5VUlyxY8ILI+6KPTyAfCrjIbCtZeZas
	 UGW/OvkPaRicFlNFUhjMqTWRrgjKrYx42TEKHQdiACEOT6zD8/uXBdd2DQwLYWMUjW
	 ePCCbRr/6nHgP3HJ1eVzwfqBWWfgtt5eKgUwmor0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 956C5F80249;
	Wed,  5 Aug 2020 08:38:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92D5FF8023E; Wed,  5 Aug 2020 08:38:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC359F80124
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 08:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC359F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="cPAgIz7t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahCvnZqV+hayp3HFVMSgReIMqYiIHBwxYAJUst9op8qxG0Dm3Jf4djOce0Y5RuI61tLKse0KsreuNIt68ZDx+2j8N97U2H0SSXNTlIYoiKuxy7eqzEBbenmWLh2TLtC2+oxKeRRl9LQL9NEKJva0ACvnclAG7rwNA1ZdvYmMnMFNnWq0o4R/Knp6xT7x3kIunL0vBoPfpCAO74r7IN560OxI4RpnBeHUh2YnzcwrEBBM48d8RItu1qYCtnk9ZlGrnhuWFhXrSK2Z4azLiBm7C3PbG4HUZtnTlGv2boicVQvieOcoUs69lWqAP4d5UbHx544kotHI0sZeEXJqB6p8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZL7t92DzqzLEiC+VamPdP7IzpNB8zfOy/8gtjkoTZB0=;
 b=LJg88MspHPM0MYymSGQ47EEq00V0SWCNf5Tze5lATCmRwlH6JdgS1zuA7795WbwyOpOy1WGjy1VjytN8a7sjwfFAD9gDwjhJO4Y2UyCMqSOXz/qcJxmJ2gIHXKuh6syRTeTuFsdq43HL88nby3AeTXaWmqAk13y7j0jnwmK6kaZvb4Cvgs48T1cscdXiI30qvLeya40LMlhpX5BUO/M70e82fTZAhfYhVA+bmHhOxLsqkSG3Ns3S58ZJaTN+MiiuyZH2IyB3bmciRFIQMtOCrGJyMF1J/VCcZN4jNr8c8/BQNjQPL0EsHHXDyjjnuWiJA6wPD7hJtbL/k0Y6sE0O4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZL7t92DzqzLEiC+VamPdP7IzpNB8zfOy/8gtjkoTZB0=;
 b=cPAgIz7tXUdce48QA1Ni19gZ3V1OewZAxM8iJIbKI4M3/8KNG1cgSHYtMzCfsxOLNG5g8cLFgOWsUOr4QSb6czYw+HPI4S6rv2KcSV/o5FKFX3U6EI0Jsgds3uhz+N8M/h/Qd0Zu1HxiVSkq98hbbxO2pDCa9UfZHmF7vO9H0i8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3342.eurprd04.prod.outlook.com
 (2603:10a6:803:11::14) by VI1PR04MB3055.eurprd04.prod.outlook.com
 (2603:10a6:802:9::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Wed, 5 Aug
 2020 06:37:51 +0000
Received: from VI1PR0402MB3342.eurprd04.prod.outlook.com
 ([fe80::c1a:39dd:a2d5:3d2f]) by VI1PR0402MB3342.eurprd04.prod.outlook.com
 ([fe80::c1a:39dd:a2d5:3d2f%7]) with mapi id 15.20.3261.016; Wed, 5 Aug 2020
 06:37:51 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] refine and clean code for synchronous mode
Date: Wed,  5 Aug 2020 14:34:10 +0800
Message-Id: <20200805063413.4610-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:4:91::13) To VI1PR0402MB3342.eurprd04.prod.outlook.com
 (2603:10a6:803:11::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from audiosh1.ap.freescale.net (119.31.174.67) by
 SG2PR03CA0109.apcprd03.prod.outlook.com (2603:1096:4:91::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3261.12 via Frontend Transport; Wed, 5 Aug 2020 06:37:48 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 56a276af-e063-476d-96a0-08d8390a138e
X-MS-TrafficTypeDiagnostic: VI1PR04MB3055:
X-Microsoft-Antispam-PRVS: <VI1PR04MB3055206A33B20E7157F824C4E34B0@VI1PR04MB3055.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dJFuQZTY48uakg2wvuVSgCJdZj2n85Mf5NZqIeYTkRAtRpIBNzxhxrZQ552SH1mpLVZoaRoYdjTbTZt0GS0qYpFZl+tbYfmjG1gFjMRAFpWMcy+sWNL9WAfmZuObZpkk7Q5Ohu6JTjiX91gGxIBPKhnGn0P4f0t/iPa4AavDai0ywB0IoPxlgpIaODZ6jQ08YaA5yMn5yjPngG0dP+mXUYaajw1kktWiqD9GfgEkAqzJEgnofKwNdWmop2BACN0jh6orpWumiW+rtJvN27CtmwJ7Ezz/NmbqNLp+hajUeNTD+fvFCFWvwBUKgxm7k8zmA0V5zu9GyqwAWvKIx1wN1nWi+72nvUaZBNxid8dLE5/PJ6fZBaRgdpP5m5qa6ouE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3342.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(36756003)(2906002)(4744005)(44832011)(26005)(86362001)(6506007)(16526019)(186003)(956004)(2616005)(1076003)(5660300002)(6666004)(7416002)(6486002)(6512007)(316002)(8936002)(8676002)(52116002)(478600001)(66946007)(83380400001)(66556008)(66476007)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: BbtJnnxgaECqyWqg4VOJzMUKkPgwkr4ZO/jC9QO5tQUdt+KTiZUEjxGAaNZnRwHexcIfzkla+K2ANKAy3BG3XB+GJ/aVvSICLvJTT8Z76P8tuWRGycM8ltOHGWFwqHMaE/ERLaxtCe33Yj26pazPJiPCTQhC2aB6tYq5si1bCBONbMbMpPySb8aR3u0XzEaCOu8TFeOD7Bn+IF7W2b2gKGkZk4v92h3uVZDO8aMiPKcQAeri1MVTdSD9/a22BCr6Wa2TSLTyqTyl7LkxC/DdLViSQ6mfIFFwuOnLkM/KodKWISEtTVoJNfvwURpI9D3S6d6U3tIioHrJr7PKm4O7boPmxyuE0f1FsSyBVSQzn38R8bIxzXW5HJfNM0T8xfQKWaMauseH8eAjt9WsSXP2lUjLjBWFgO2sGwIS7WGX0quyqMFmXd00cpmV3YazXwvDvr5fnrgrbkYzvLa/kMyE/YvF0En4Ze5PrOxGpdLIRx6UmPi++H0eSPf/GaxzvWMYAuxKJaWa9Kv+j4HFzykaWT+exjYyNJ5YRv1OozUm/3u2pdKfmcA+pkYmpHqwkHzvJJ2PpM9VqxRNldUj12DAbpNtBDNyMBdn0jQ0FHP4CFOp+NTKV2atdVMWJA3Pv1gic2H7d+BcgFt2e9wK9HEkrQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a276af-e063-476d-96a0-08d8390a138e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3342.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 06:37:51.7590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFdCtbOwe4DLLcCtCA2XTZdf7oRrqHU3fZeQQ4L+mSo0HZC6IdCwxCaRxgh6bDQ6j8tHfty88IY/zS0cGQzMRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3055
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

refine and clean code for synchronous mode

Shengjiu Wang (3):
  ASoC: fsl_sai: Refine enable/disable TE/RE sequence in trigger()
  ASoC: fsl_sai: Drop TMR/RMR settings for synchronous mode
  ASoC: fsl_sai: Replace synchronous check with fsl_sai_dir_is_synced

changes in v3:
- Add reviewed-by Nicolin
- refine the commit log.
- Add one more patch #3

changes in v2:
- Split the commit
- refine the sequence in trigger stop

 sound/soc/fsl/fsl_sai.c | 173 +++++++++++++++++++++++-----------------
 1 file changed, 102 insertions(+), 71 deletions(-)

-- 
2.27.0

