Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E89580893
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 01:56:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A864783E;
	Tue, 26 Jul 2022 01:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A864783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658793403;
	bh=cnhtErBT/uA8WPmQOq8E8jMOEvVkKiNTQ0NlQ6m9Wmo=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f4H/A4obEpAyINJaTiPvkMHn+9iHl4Y/xXI7HMS0JbvsWvW7+VEWF15iaSgssGRHW
	 hG+urM7NuevUNobq/ZYFjWQuqB1WdbS5dtvsYpvJRP/MoeadF37/WzQyWMQi73yZRk
	 m9Hhptgvi/gOnthjygW4e/o5bxo52FFUDEPXtgN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42A2EF80212;
	Tue, 26 Jul 2022 01:30:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 507DAF80163; Tue, 26 Jul 2022 01:30:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2104.outbound.protection.outlook.com [40.107.114.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1208FF80088
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 01:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1208FF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="Cquy8F7S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5ASLuiPfqAqtMZvylpjICpaORjRZ1i6qwYL/HcH+w67VgDUc8MXI1vJnC00IN73bg+sbFP/fgHOQu/oZ6Yvo8ZjrBCe4ux3jV0h7B+mLE3OjJsEkbAMX+pTqkqzAqBCmip8tklFnP7t1IoqjM/v4c39V6HZL2e2202rknixhuUIv39ZD+meB6GbvTc6bXyjEEBRUbpGz2WhLkHQn8JWmw2dRt8lltl3nhBhYRGOAfLGylYe/UvKGBFezq3h9/PbGH+BPnf64RBc+hzZBSbJdfu+lFa267wJ50I1YbWuuEIZRf39UmIznsK4dqn4JuC5+RlAvBbVFnMQDcmIK5UfRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnhtErBT/uA8WPmQOq8E8jMOEvVkKiNTQ0NlQ6m9Wmo=;
 b=aIWkKJ0T3W8A1Fqw3XZ5/pTl8B1I10v/+Tbw0gDn3qfym3uMNFwXDSd3fLuUjiCCLobd2vE4cqLgFwX7A6hiG7oGU3dGhgEz3gd7qxlA1udMPlN1aA1K1r0E7KtD4wqdZt1ql2rR05U17LtOEAnquC2q/IgYryIN8xMVuC9wuIHPbw6ojKMQIjFzu/QbxYb4YmyvQ7EOtCpGyQA93fJlAza46zjR0Fkb8BgpALUHC2B7Cl1XwdiilPn3nKwjZHfdUBpW9Ec2nTu5tavuBBegZy48X4u1hUAyv2gRRUsrh9mdRL69m+8c8f+p9OSYx+B6AP6ZCgpcAfP+OhlUnIu2qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnhtErBT/uA8WPmQOq8E8jMOEvVkKiNTQ0NlQ6m9Wmo=;
 b=Cquy8F7SWyosFRYgyOBOHsA1AEM4Oe55LDKgJj1NsWsekyLFmZd/07cWK1VWXcgT+h502TUBiITTaHfTlWloRuyYs+u28WXyorIC61BOr1XDd4vStpN59znB/QOIplg83lAMpXWbx5zf3+x5tJ5i5xL8Tyo6HonYgEqQwIAj9FY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB3013.jpnprd01.prod.outlook.com (2603:1096:604:20::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Mon, 25 Jul
 2022 23:30:05 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%6]) with mapi id 15.20.5458.025; Mon, 25 Jul 2022
 23:30:05 +0000
Message-ID: <87pmhsvkhu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Question about DPCM locking
In-Reply-To: <87ilnlb6dx.wl-tiwai@suse.de>
References: <875ykmx0vt.wl-kuninori.morimoto.gx@renesas.com>
 <87ilnlb6dx.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Jul 2022 23:30:05 +0000
X-ClientProxiedBy: TYCP286CA0071.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36705a7e-abd3-4e55-6a4a-08da6e959b17
X-MS-TrafficTypeDiagnostic: OSBPR01MB3013:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dU7X9iIp7W0RI/PBFoIoqLzSzS6j/QGnDLWNLu2cm7xGLPcaTzFavZfUnavHUyXLFPjBEdH6b0cD65dzZctZvBcOY3TWVUTTBRc4PB29ZT0/GVV155kea0eVQYPfRkUYT/jL4pO365xhz8UJNB48iRfCP4USCc0SM4+LESmBNFSy3sUq3Re534tO6i2Qe3DkZGKdMBLJwKGTrGffAFS+KztJLC63ynnDoztjKuxrMq1UOhZsKkEUgyjVQ5auElezGZTNlSoPaUeT2+0SF3IzXLw0GTX1TDCnyCplQAUfsOGDE7OIy5pd/f9hcsSOWTypwkTxhvFjbgnnKzn0O3QC1Q96dO8c9/6MkXvH+Z3vyuSJElHW42v/PVYxps+1lFsjb7NK0Rhd7ILZCbtcqcLD6FpCYWM9bKYgjRmyKyf5ugBwHn/dG3lpsYrDOQAmb58BzcXH+ZiWBxk44a1/dx6M5yhEETvLHeQZP484JzqfgS4ZvLyAufmbdi0EU0clxW8EZpE/PVkhiIe7hB6bGIjRsXKJ7vXKVV7fhBmzYruuJ5SOdP75sIFqtmdymtblgdIKrFQVO2Rb6MscKBOPNHmH30/NI0bQgTaukDXrHyrlpDPzc+5KUXTqZHJKOHfzC9WSO6Y8Cfa1E+dzXiZxitVIoaK0jtcDDRUs7eYPixiAMMtZD7ZgFJyOccQ7DIUaonuZ5m4CSqh419j83uuhZADoA1HDeN3mhImn1aGraBidiEjhUN+ohJBWlR1/+osa7QWmK6NXieQwddn8TjEocTdlqpU1kGHxb0y3ztXVCEuoklw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(26005)(6916009)(2616005)(6486002)(38350700002)(83380400001)(186003)(38100700002)(6506007)(6512007)(478600001)(41300700001)(316002)(52116002)(5660300002)(4326008)(66476007)(8936002)(36756003)(2906002)(66556008)(3480700007)(66946007)(4744005)(86362001)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sJKegZh3OFNBfBMisbNHVbC168juGgvD4ePfOt6YALkMFleu9oHNVK1ex4Dm?=
 =?us-ascii?Q?stpSEe3Db6yWacIGTGJxic7NbAqnex1IHX7o672p5G2NK3Yqebt25kuLdPbP?=
 =?us-ascii?Q?3UP67zZ4+0Qco9ETp65XA5bZPY4ffPgajJGJij85PXFU1Y/oEVwxaCZoMT0t?=
 =?us-ascii?Q?dOLt0v1G85DZZQ2QIYKn1bpf9GwYmt90HX/vKrq/JC1tcTcgbrPjMSyw8ZxN?=
 =?us-ascii?Q?1YkPrrv5pAnYBFB/36gDUJhcMhC2D36MFSNtAS15YEXOBjMeZznmRf4UU1oh?=
 =?us-ascii?Q?HlLqtCxuKwHPI10mcRaL9V5GmwOb9dMR3dE+eFPA2hmeIeEJNJVob7TaTdjt?=
 =?us-ascii?Q?twry19KnGq/6kPprggIGRszSiuefKvbt6mlVaYojj48XrglV4xlVkRpuY4kn?=
 =?us-ascii?Q?EOJRxy+ydXgVkCEoRLnwagqLhVJVrsjZ1eeHgNu8a7cAIFT0t2UKjSw3QKex?=
 =?us-ascii?Q?NaJIiG18KUOyd3e57dniGwcN71DS4+QmkdzTTlDlqcQnxpx6C5OAjBZ9j0AT?=
 =?us-ascii?Q?Utbh+LXPjif68EBVGrOO7kCyD1zx3yIJ5GjguErdwuuH3w8h5OXsg75xoV39?=
 =?us-ascii?Q?/TMcz0piCDNn9eQcBpaLOllMjnkiQj3NgfrBbNg0jt7r5A5H5vd7war9Yqn1?=
 =?us-ascii?Q?UG/7InYMeMqdH0q+j4V2merzYbPrXh78MCKSN48EQGdJ56I3A1CjsOH5HNkx?=
 =?us-ascii?Q?ONAHIqoitqGrvsf7oVDRMxgOPp8rtYvqACYVgoWozRglLklE8dsn/4clzdiw?=
 =?us-ascii?Q?+8zPkNrlxd3VVKqHcTamsbjLjkwBpwg51vDIJvxY5HLf6kviRbpFb5C/0dsA?=
 =?us-ascii?Q?G9gt7h0kZNgihT6d1eqJVMjAOIB9MVKb2wiK5N7OlubQVJTHnBgHmF7TGJ0O?=
 =?us-ascii?Q?8Do3u3NvLBf9tK/tRLNVI2jt34OthKyA/hnbg+CT2NiEjJypc48tZwkeUvh5?=
 =?us-ascii?Q?O1bUeMGZctS2GhPTo9tJpbl4baG3JLq5e/nXznA1C6fVrSBppSA5Rj854wLx?=
 =?us-ascii?Q?QmHXgmXyKhK89xnt2zfQ7Rg/J56DN6/Edc5kSjMHKPfeTGKdlwUCvBYUd6Kh?=
 =?us-ascii?Q?5QixlczObmaXafXnr9Q//E3AHaizd/zGQBYvyVCtwG6TFGhj41SiEhGPItnp?=
 =?us-ascii?Q?ZYaFoQLEtVa85hJPniT348pPeAWPxmwEZ7rqvvYAxdrlQxoNaSaOPxhxSv4h?=
 =?us-ascii?Q?yqK0Vsp2ZrpJnTQX7UWpPkzDq4lhMKizrI+o7Vgi37d+EPBD/mQfaJoKDGKl?=
 =?us-ascii?Q?GwYolZlEaHxFnMeMrJDXEgao1UQHcMLGU5V35I26X4pFYpAxR3Qcu3Rd6C+O?=
 =?us-ascii?Q?ksZw1ba4bojB3mAddz0p8Vsj6GZNJyUoZoCXV/px/NrwM1/t8cU7aD7S0Ge3?=
 =?us-ascii?Q?r5qL1Gh000oa0IEu5RoqdHXZXMjmqMwOCeSVVhWWIk3PJiM9uprGkgGqi3LW?=
 =?us-ascii?Q?glE9VDKxusJZqHtmDNPOZ9aNaahqtiMw0q/w2Xm9a7OvZUzOsedDxdTx3ziM?=
 =?us-ascii?Q?JdFA0K67af5onZGVhGF7ZCJmZ5cQRmEmTGcrzgY/360AIdQjv9Frzmi43l1B?=
 =?us-ascii?Q?Zn8lkiE13ADF8uqMCHroeuQBbQM0EqdgClsrbgiXFOEUeMoPvkwp2j5WZUxr?=
 =?us-ascii?Q?wnDsl2f16GRPNbtIn4Anim4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36705a7e-abd3-4e55-6a4a-08da6e959b17
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 23:30:05.8469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gE8n1Yr4l2v5/KDVcgxT+7TppXShyhUPC+iwiXd7rHlHkwX+zid8nkh4Khj2dwbkpaR0IT1z1G/6zjgBjAtPPoWPQj72PFRXx/Wh4qijJ4SVPFjeQMx9IjANvbuMmv/0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3013
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


Hi Takashi-san


> Not really a mistake, as you can see, that's the very same code :)
> That said, it's fine to call __soc_pcm_close() there instead of the
> open code, too, as long as the resultant binary becomes same (or
> better).

Thanks.
I will post the patch at next -rc1 timing

Thank you for your help !!

Best regards
---
Kuninori Morimoto
