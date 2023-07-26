Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3287648E5
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 09:39:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A35984B;
	Thu, 27 Jul 2023 09:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A35984B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690443561;
	bh=OVH5o0wfEPgand6tMMqaiX5CBbdOZRGvSfBYGfT1O1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KUpnfJoWMU35pCvsJnfHvUWb3Y72o4pQ3SZ6bZCFvMwHj2pXYnsPNWzBfaUEQp+Mx
	 smNi1cBQcqFz800IdexRP3u6Nmw1LLCW9wwVn4uy4Us/osjxKp4Anb00ghjR8apygX
	 P1W63w6GBCkX7u2ildwB1plXO143GfR6E4s1pedg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70DC6F80553; Thu, 27 Jul 2023 09:38:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 712E2F80551;
	Thu, 27 Jul 2023 09:38:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C4E3F8019B; Wed, 26 Jul 2023 12:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C9E1F800D2
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 12:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C9E1F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com
 header.b=bZcAe3+g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIFtW7p5NneMA7/nwVeSiqn3z+HdxwnXGuB0xHU4fC4d3Y1PKKee8mUSWdiUMEAFQoCjU73MRJXcGngs6lhB/WEKPGdV8y5zmymGOVvPGujkIMqIEhpnfMgn4lvU6koH8LZHnxluPOBa0wzcMQHiIV4zTeIYnMm5USaD/hi8DZv/9v3J9WlJQzO5L32DUbGOY8Kv6O8QNIR20KAwLwxwZ+PqbeJKfECjW+xLInwscvvTvv4xEHPbO7uKwczrv5i6BZAE8O7Ql/v9Q3GutkBx15MAho4Pj/8+W/HVOKsmQG+EBAyPrgAsgxsQfmUNcVcxm6wsHoSwQpnmHqopQb0KgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlKAvKBJ6Zu1DJbtGkdno2FuJG2yLtkD7FFG7VtyokA=;
 b=IBeT+UbM/sh0hMjpHFPtLuuX5aSYnFfDYLnAIb9i+AEUqMdPsUWs7oXrbocol77sXVoIhY249fG7X98yoCjv0vJ8LC0LLVABEOr5zFjIGwYKOsT0KwsAD9+yQWOdAE9yfprvasZqi44F8F4tZjbyP+ZtpysWQik3pTJwEPGJDi4T52n382j1tAmzbKxcU4rB0+dyIqUHCimhLAujMbdbbd/DuTYmCP8022As4r5qN7++i9oWzqidOqgxY1yfU3GkSRReHtyBgtLr4LkhBopKb1qxlUABv8NfT8GJNn2yZ5yEZw2jCC7x46v52YbdwBVdLXpl0/Euln5+BuiC6GmN9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlKAvKBJ6Zu1DJbtGkdno2FuJG2yLtkD7FFG7VtyokA=;
 b=bZcAe3+gwR7qqLqHPot6JR5gfnk5IVmEoBNTsuUvBdRI5WOkDErIj7qh5NUHAzqeXdV7GzO0/wBPNpUg3/dAZlf2z2Ubag7PLrXBfHYGX3z8466AANOFy4bX3hMzWDV+RJSoQ6EmxeBg7iBGdLdIK4xx2z3+aPOMNip9f0Y1u8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CO1PR13MB4840.namprd13.prod.outlook.com (2603:10b6:303:f6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 10:22:23 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 10:22:23 +0000
Date: Wed, 26 Jul 2023 12:22:12 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, alexandre.torgue@foss.st.com, vkoul@kernel.org,
	jic23@kernel.org, olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
	fabrice.gasnier@foss.st.com, andi.shyti@kernel.org,
	ulf.hansson@linaro.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, hugues.fruchet@foss.st.com, lee@kernel.org,
	will@kernel.org, catalin.marinas@arm.com, arnd@kernel.org,
	richardcochran@gmail.com, Frank Rowand <frowand.list@gmail.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 05/11] firewall: introduce stm32_firewall framework
Message-ID: <ZMDz1AhlEeZTM/vi@corigine.com>
References: <20230725164104.273965-1-gatien.chevallier@foss.st.com>
 <20230725164104.273965-6-gatien.chevallier@foss.st.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725164104.273965-6-gatien.chevallier@foss.st.com>
X-ClientProxiedBy: AM0PR04CA0040.eurprd04.prod.outlook.com
 (2603:10a6:208:1::17) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CO1PR13MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc01507-a6b8-42b4-4e80-08db8dc233c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pTSGKGSWD904YY11SLaR0Cg3LbsXcdHKOlWv40vhhIqen8/F06Y1B5SvhQZn8gcU0fqpqpsCSRWDFCvtPl9qp6TLRArlBuBk5NAft/MF+lfT30QmMPUWBwHmwVpghoWV9xqLYE1vN5j/TGVB5e24UUeKXgH59GIOuDfHf3fh6N7Wx1apmq4AM8EKgRW/ya02TuL7R/TKq0+TDkwuFuDgtlgNmPMQEDbyKQ6JdK6R0AWa9dfmz+Ura/9vb5lPT7JzKu5p8A9wEnHnDmsjNMRqY+IXo7HX/M9NLEfLTU/kju0zV7K55dKp5ok8msjKgmKc7YadJF+TtfO55hSxE8/YPoNZzFCs8IncVu9xRoEPlZPbSfHV6ODIzRuIZcHJ8U6l4lBJozl7KUtXNpsqUAVboBMCICrWrjzbrA0Z6XQ7RxlgfUIov2qe29OYC43+ZulEGxITh9F/uBNLw334giDPBGxhDnZIpVXAzJYv9T6mau7TXuSD4SZoIR1RDH17GtEoQXRXKM41dE/mqorzmUQVSFyHa7GAJLS3etvIQSMkhDFEXHh8SGiowO3pKO/bdcNzlVMP5Y1ZRK18L+wGkNk6zFJ8TdEMWRS/hEypyqtxSvo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(366004)(376002)(346002)(396003)(136003)(451199021)(6666004)(6486002)(478600001)(6506007)(6512007)(6916009)(66476007)(4326008)(66556008)(66946007)(186003)(2616005)(38100700002)(44832011)(5660300002)(7406005)(7416002)(8936002)(8676002)(2906002)(4744005)(316002)(41300700001)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p4dhcp7ceHRMf9PxLP7UKVmzkTGc43zOFzIfwC2eB0YKk2CBEclCXiiYx7wc?=
 =?us-ascii?Q?oSP6k0m3zGOuAfpBms/D7bcEuyKA8HdAAdHPXEnWG09oLmqpcal/93EA7edR?=
 =?us-ascii?Q?T4LjL70cjR83snnbD++RSu+fDwJMHQNdf38o+0ThFDILhjkq8wZeM7cBOZ0G?=
 =?us-ascii?Q?5SgHA1XLozcDgQhBFvSw7bE/v9HcoOp45xzXAcnaoxb4JHDvzrMHZD5jcz9Q?=
 =?us-ascii?Q?QrqKKKipPVI9gSzR9yjvFgWNpOSHcqbyA9KhwEACVA5u9Sm/3OK3hEY7tGY2?=
 =?us-ascii?Q?htWoOGeUxfeX5KXlR/FXI4+aaq6TEbvGu8FqVCvaLDdtRJNs3Udc8SVMgZZR?=
 =?us-ascii?Q?JCRwR+cCQxAiGE9Vd76YYHwZ8+zOW9P+9vRrB6fPPToVS8z+u+46puXgAoTk?=
 =?us-ascii?Q?cbuksAIqkZA0EbkTF7CClyIa7Bmikl8WfQ2vUe4EX3GI+ROGJNtrKEc3VEiT?=
 =?us-ascii?Q?TBz9IV/MJ0ULLYxuLwyDL9Qs4hyxMg93/NhYXwcmcuaUQVx/OHcC2cVt66dD?=
 =?us-ascii?Q?pJmKmUQj/pzpl3zVCI25zF6QCYHgIXgj38mq7PSJcq5UvNNPn/CHiYPacDQW?=
 =?us-ascii?Q?+SXWpMZIoRU9Wk2OtDg2IOnOOgDqglFBFnZRci9EF9IMprpHgZWu4EWPBb0N?=
 =?us-ascii?Q?YZidnovZcqO6SML+djrs+o/PxRMdNEa1WXvsq5CBg3DauBG34HlguJ+i4pNm?=
 =?us-ascii?Q?dYz/CPQrbkdlLfa/8KQHhu5lAb/WFVUSeQWfkhW3vvh8mH+Fwv9Pa4VYEalI?=
 =?us-ascii?Q?3ua2NmFD+umxSDu0z4ZgVGP0vrtQFdyyZNENaKQDRLRYv8BcDlPicaKgS/pR?=
 =?us-ascii?Q?xzJrxnGh48Al0UThh5zTSyjq4XAl36vXYlU/YfKZ69OXLBBf40BPhwRJ8oms?=
 =?us-ascii?Q?eL2UDbtN8a3Zv7KL+TCYiTLVDfJdv5WCb/bzSO7Tkf2wjmJP4Zh+w6nkHl2Z?=
 =?us-ascii?Q?aT15CjkowaP3CbfHAQRlKBGNcq7xg31x8os//IfSYZmlCSzduUmW9Z7mDRjm?=
 =?us-ascii?Q?z/mZ/3TYOprMDcSn1exqjYq5ggW50NrKAELXcafUAftxcujUvuAjSANNE9Lv?=
 =?us-ascii?Q?RxY2jm/ERQrct0iVFKPlLdT5xX/fvd2lyi9wbAq3t1fwIOHBduuEKy4rtKMn?=
 =?us-ascii?Q?GPYoNwyZ9G0j6oX9Uepg1aWPXn3OKg+J4CXZc3goFclbaN/+3S5NFtrq0PB4?=
 =?us-ascii?Q?1SWGnemlv14IxQgAs0W0mmhn5mtzTn6G51BFRXTD3fiWYI4iaqdZu2rNExBU?=
 =?us-ascii?Q?WAf8KdZoDiOS7lS1W4sfjgYtr5fixj/egOb8lnSsMr8ImRfq+sQrnYC6oXqv?=
 =?us-ascii?Q?oPV6+FtuVoRxqkcpCfOFDi+rdBmgatQvDU4PiwNLPBi1girWkmBMtLCAraO/?=
 =?us-ascii?Q?BSsm+q9ycQOKUNZaCfi6j7dqkrv0asixPmQ+4xm+9gX1cfEAIOq+ugNDR1UH?=
 =?us-ascii?Q?ScGObKZjHwZPHEVxqX3EnVpCKUjKH3ruoK8BdhxurUs3UQeAoyqBQe2iFQ7A?=
 =?us-ascii?Q?k21ifWfKlM+dnu15PIYUiyE3GdQqGtD7h25jidYDyY+7cRKfXz2gpuUecx49?=
 =?us-ascii?Q?fNAzaGQjuOOxQAEQvIDj7weMoX9aDQs+L2xBWZM12HRySHiTHRwRAyWZ6q2t?=
 =?us-ascii?Q?rz4kCfoP6FGCARnCXwcwTfnSx7GNO2zsU/xjQtIthyu1DednUOIIcBe+YRSa?=
 =?us-ascii?Q?dO9W7g=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6bc01507-a6b8-42b4-4e80-08db8dc233c9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 10:22:23.6707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 85f4MKcsU35zyTU6yCfRjheQIZ5KfV20YFbpawl8e9rEALD1U4SpjwR/z8XrM4BTMc8GG68BHYFnVXxyjzuNNIrIsJxxDpfGfQmdRv4Qw0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR13MB4840
X-MailFrom: simon.horman@corigine.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Z2B7L5AXEQ4GPL37S64UEXRNGJLWEU5B
X-Message-ID-Hash: Z2B7L5AXEQ4GPL37S64UEXRNGJLWEU5B
X-Mailman-Approved-At: Thu, 27 Jul 2023 07:37:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z2B7L5AXEQ4GPL37S64UEXRNGJLWEU5B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 25, 2023 at 06:40:58PM +0200, Gatien Chevallier wrote:

...

> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c

...

> +int stm32_firewall_controller_register(struct stm32_firewall_controller *firewall_controller)
> +{
> +	struct stm32_firewall_controller *ctrl;
> +
> +	pr_info("Registering %s firewall controller\n", firewall_controller->name);
> +
> +	if (!firewall_controller)
> +		return -ENODEV;

HI Gatien,

Sorry, one more on this patch, that I missed before sending my previous
email.

firewall_controller is checked for NULL here.
But it is already dereferenced on the line above the check.

Flagged by Smatch.

...
