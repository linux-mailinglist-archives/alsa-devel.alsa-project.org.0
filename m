Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8605B841754
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 01:09:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A68A1950;
	Tue, 30 Jan 2024 01:09:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A68A1950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706573389;
	bh=UID8YUH/y+PJL65eocxkjLJUqNysv8LQNPyTZTn2wgA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IUX+MgVTUbcBvsKnCnV4Uv19E+XAqYbJtjPmratvotLM9DWGYgOzo/7rxCnhtslj4
	 +iFfCEhfi3oX93uZbvB8rHtnYtFKxz+eGkChnzaZG0jY1T2keNw5wOkkp0tCycQmCq
	 dAhxROKWNzVXeVDlVoPvp7e8Vad/NXAFy6tZJ8iA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0BFDF80580; Tue, 30 Jan 2024 01:09:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69DD8F80568;
	Tue, 30 Jan 2024 01:09:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63366F80563; Tue, 30 Jan 2024 01:09:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C46F9F8055B
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 01:09:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C46F9F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lalu7Up/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+ImA0N/sluY5ZxvtnuRbFg4LJV25UW++m2Jc2FGuah7/rGHBdPiXKAbZVChPhMQO9AFa3IncjfI2oUkerFWbsg8IxOr8NVZ7rQcWDUdv1rVOG1Aw7BpUMi6D2O2H+u/51yjsoqTyYzhoFgB13MUSBYhphas/Zj6VziHfBAKwvZpVa6MNtPVxF3aEvOzRWSllsHY5U/rN6H3hWHr5Zd1wfFKDuk8NtMImunVGHU+wKe4bBm625knHV4kBoGtd9UKBceNybEviPPmc4Yt6N4/IrCtdqVE2ASQ44QSSxu9AYmp6uZWl84a+J5jlFpvkGgcP9FskjRP/dy0LXbpNqn6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6LrgndbrAzFGfoWAaKkp5BNlKKHIVmSZ3qGQwQ2Kb4=;
 b=m4YIiuqXhd8LG3tHwl/2i6KyzOeFNPIYacpMiWJflVqd2ay5cUyyU/S8GJ9wY7SEAonhPJgd+TpLSyDfNCCQMVOYrNu9IvD2zLKTAu1YCqtJ5b+OdmN/CE9H9Kp9A5M8MV1TA30gCcjfrc/3ygps812peN7uDirZESFhMo1E5ff7+TiSM+hqwq5c9L6nDoWF1RhEA6eOqFaEGwiKC0SK5Lin83BEM3g5FBriVYa790yCeY3qGRc1+S+a8MhoaSySmjU9gQXdDijVy6S+/UDz0M3Pbh8nTpzn7CsgaS3nuZel83SgLhKza8bkoBZLcksILlEwYh0hL3JfdAC9rkq2iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6LrgndbrAzFGfoWAaKkp5BNlKKHIVmSZ3qGQwQ2Kb4=;
 b=lalu7Up/cKhF/cM8o+vIomk18KwaoFR4cQ2mvhediIobwXss8yosA2su8EpEOlC7uLEZtsY0Shq1dZm1FLO4AduuRrJIrZtNDnnCGdFUUH6xZUOJAZ/eUucUtFpj7Qp/t81VhuoyJr9Lg/2eGN4HmmpgKL1dwNqB7YuI0U+N4zk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10423.jpnprd01.prod.outlook.com
 (2603:1096:604:1ff::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Tue, 30 Jan
 2024 00:08:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Tue, 30 Jan 2024
 00:08:54 +0000
Message-ID: <871q9zk7hm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	alsa-devel@alsa-project.org,	devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org,	linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org,	Uwe =?ISO-8859-1?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,	Daniel Vetter <daniel@ffwll.ch>,	David
 Airlie <airlied@gmail.com>,	Frank Rowand <frowand.list@gmail.com>,	Helge
 Deller <deller@gmx.de>,	Jaroslav Kysela <perex@perex.cz>,	Liam Girdwood
 <lgirdwood@gmail.com>,	Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,	Mark Brown <broonie@kernel.org>,	Mauro
 Carvalho Chehab <mchehab@kernel.org>,	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,	Rob Herring <robh+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 03/13] of: property: add
 of_graph_get_next_endpoint_raw()
In-Reply-To: <20240129130219.GA20460@pendragon.ideasonboard.com>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
	<87bk95klgc.wl-kuninori.morimoto.gx@renesas.com>
	<afea123c-12b0-4bcb-8f9e-6a15b4e8c915@ideasonboard.com>
	<20240129130219.GA20460@pendragon.ideasonboard.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jan 2024 00:08:54 +0000
X-ClientProxiedBy: TYCP286CA0266.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10423:EE_
X-MS-Office365-Filtering-Correlation-Id: f48a373c-c472-4db3-d9b6-08dc2127a55c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ub2IM3zIUm1Y3mGppRgEebCWOxqFWZ+RfXzBBC+WJ9DS24XrSifRqGUHg7WqP0TfSg6m8azW4Ayxrvlhin+9SVrprpdLaDt66s6wHd7k9A1P6hQRrH7oYmyzREEXTSltlugtsYlx+IdAJz8d60fy2SlTfkCR/Js54fNzNZ5Y9KMoNkt50029hBtn154isX/GYe52g+hQBPwCPpLz+4XacnJ+WkQCT4n5lniQTT3klaFsxqwiJ3Shru4rgtEd8DOJjuWpohhmQjMHJ7hDX7t/zaWBihtv4tLYOT15XFQ5saaf/SuzUDcGSJ+ih6S5btij4SHBjKqRzWJRHH4VdwPmZNDZVvcO9hySKxF6M+OLiMTE/Xu0JGpMv9QAvB7ttxt+qhAgNUM0PRRMEq4rruE3W54Omz8DhaiV5u/cq5Fhq1W7FCBoeG4S+tYkwcDZcEKW4p1XZFsQdI68JksbffzrtwFGkLhonqNGo59L6mGBGq4+hvijCE5zRpW1hE+LhsXEyQaxtY7z7Na++lpMeyYx+JHq9b278byjXdETtPp9cB4m6ySoZMq3k8A6fT+7KeOA/cuQ+4kvzMpd+aho4DhZlKIAzSkikcdB821YjVblRXY7HGv3VuWnxA2Ye7J50C0h
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(6486002)(478600001)(4326008)(8676002)(26005)(86362001)(5660300002)(38100700002)(41300700001)(36756003)(8936002)(2906002)(2616005)(7416002)(6506007)(52116002)(6512007)(66556008)(54906003)(66476007)(66946007)(6916009)(316002)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W5lpk1saSzkKEyjS7OOnKIHS1jgC+VcXIbuJ7F/A5SkOBViiL8bKtPvywQKk?=
 =?us-ascii?Q?ETu3yF9X7RIPv6bScF4W2kq2qu1MjW+6LViNVnO9LCMpbjVrAedTbpSOfL0u?=
 =?us-ascii?Q?+qeTaDC96n6az+FCWUA8o5SulzA53ul+Wq14acR1GzxH4k+xTYwzg5tmg5R1?=
 =?us-ascii?Q?H+Mht7G2eYASKm6B3TxFQxBF/Znxj7yn6KTf2hXxLswBS6kAa4coSpBdZU3N?=
 =?us-ascii?Q?UJK3t5USVVNyhS8hE4VhLMkqoQ0TGDl7Yxq4K4anOpOe/PcZRisurmjDaMYE?=
 =?us-ascii?Q?CzSZ94Ch+FGXslJywcjW4PpnjxtBUQobIQtw6A7URv+0xwKJAMJhebECbiLa?=
 =?us-ascii?Q?eEa4B4m0bxiMK34H7ytsPVmovsQy0nIrQm09frR4IwUyYzsp385nhzOghbcY?=
 =?us-ascii?Q?6iz748TTlWXUZAF+c9eykTRHVf14mhJGO9cqfJ7xynlxEoXYIn7tFsdH1iW/?=
 =?us-ascii?Q?ZzdQCFWSWJJCUU4Yb9+rjdIBQzQzK5pwNZULUFMNd+kUQq9sD5nJptiwjAoO?=
 =?us-ascii?Q?9gGWmX51m8Lw8vO6xIGa/ZkeByHZzYn29TybQ1m2MmBDWOZtVEjz3v9DKjCf?=
 =?us-ascii?Q?DBmlf6w7fxSngswj+K6odtjC9oeXE48QWjXopHRi2zikpUbZMvNlrNPuS5+4?=
 =?us-ascii?Q?Wr2N7Zqaf+4VIVU58qg1hBczy1o3lSkvNPGMUNGm5cc4VCLZGr1TleHGdYpF?=
 =?us-ascii?Q?XGxtjd7EN75kUPT7JW0HJF+B9+f109eD3mRH7aOCbcU9z9QTQSZTaWEZQbEq?=
 =?us-ascii?Q?YfxmCmrMh1AOg3Rd7DVCu1QWSKP6c5IwENH6TmXhhS/VldYe9ZVaYxmsHIOs?=
 =?us-ascii?Q?2SfHkksX4b5LeJ2xiFm7Xxmos+FkBz3bAMF3jOAEY8qdA4NMn/L9MoM7POSb?=
 =?us-ascii?Q?FCaOFOd4uFF40n8BKet+90A9rFh5sWHlx1m0fEmJM2cuSNqvOp6UcNYtAPYp?=
 =?us-ascii?Q?TNpL93gz0k5D2arbJM11u6rYF7lhRB0rQHfF20EQhyyaEw+K9AUfrrG5a4qK?=
 =?us-ascii?Q?TkErcAFlTWHo+ysBM9WQ8JKmi5oyo+XIOPnphHKRZFSUL4VaQnMfKF1okh7A?=
 =?us-ascii?Q?3/vZUXqMBDi20rAeXvhB4gB2qtY5S5uojodYUg5YqShj4A9H2HiT/QM4PY7z?=
 =?us-ascii?Q?mJusuPss1R+LmQq3uTaThaTay0iMf5mjX5FCj5zhp96p7I/JQe0aR8MbdHMT?=
 =?us-ascii?Q?wqd46wCY2XQthZRXQg50rzmB/+ddH3edHVu4RAwlGd4jxqgVRROeov9mU+Cb?=
 =?us-ascii?Q?tEFXcEn1yGu7QJKfLuGgFtGtsfuoY+jaBL7vLB91QQKqXVwTX5wrw9ACxPW0?=
 =?us-ascii?Q?7Ab1OQwY0E++WQDuv24si75ffxXyWWDa0ABW4wcoVKksPOwhJgl+XjQ36ocN?=
 =?us-ascii?Q?dVjKpMJz652/WJagnggDwFHztw/FAotoIwCd4277vxM8dFf39taHZUFWUpOa?=
 =?us-ascii?Q?GraqZj2nrRGW//QMaVT1l8U0WBtWqDelfp75HdpUmtvpf0UAbZlDbk2Tt0uw?=
 =?us-ascii?Q?Kn/5cQ9682lOxJTGyegINgfBpdHc6caBPgGHFnTmPY9LIVXTcoRjHYQ1uTPo?=
 =?us-ascii?Q?qo0ocyHrt4ph0VP9FksqFugT26WpTuZ1rf467yJA5dxaY2X0JXmRsgoU+NdV?=
 =?us-ascii?Q?9ZFh03cDfQzNbWku/oVLSAg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f48a373c-c472-4db3-d9b6-08dc2127a55c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 00:08:54.2519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 D9btOafCy0Aok/UQdPEDcZOMbRey2vyxMfTYO9+EqC5DDjp3bjej+ovW6PteMeu61sT3ddWp5V90itgXt7eIaBenKB31HTsSQu0tgxA8IRXMtCzA3rkj45NsPd8tXAoW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10423
Message-ID-Hash: NN65JOMHEXT3VOID64JYBINOLWO3DQGI
X-Message-ID-Hash: NN65JOMHEXT3VOID64JYBINOLWO3DQGI
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NN65JOMHEXT3VOID64JYBINOLWO3DQGI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Laurent, Tomi

Thank you for your review

> > > +/**
> > > + * of_graph_get_next_endpoint_raw() - get next endpoint node
> > 
> > How about "of_graph_get_next_port_endpoint()"?
> 
> We may want to also rename the existing of_graph_get_next_endpoint()
> function to of_graph_next_dev_endpoint() then. It would be a tree-wide
> patch, which is always annoying to get reviewed and merged, so if Rob
> would prefer avoiding the rename, I'm fine with that.

To be honest, from intuitive function naming point of view,
I prefer rename existing function name. But yes, it will be big patch.

Current of_graph_get_next_endpoint() will get next endpoint
beyond the port (A)
New function is not get next endpoint beyond the port (B)

Something like

(A) of_graph_get_next_endpoint() -> of_graph_get_next_port_endpoint()
(B)                                 of_graph_get_next_endpoint()

> > > + * @port: pointer to the target port node
> > > + * @endpoint: current endpoint node, or NULL to get first
> > > + *
> > > + * Return: An 'endpoint' node pointer with refcount incremented. Refcount
> > > + * of the passed @prev node is decremented.
> > > + */
> > 
> > It might be good to highlight here the difference to the 
> > of_graph_get_next_endpoint().
> 
> Yes, and the documentation of of_graph_get_next_endpoint() shoul also be
> improved.

Yes, Indeed.




Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
