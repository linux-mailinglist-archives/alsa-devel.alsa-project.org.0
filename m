Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E2C3A18C0
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 17:12:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF4A216C7;
	Wed,  9 Jun 2021 17:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF4A216C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623251520;
	bh=8WxEM4irTGbD1qLds/ixE/VBWN1SZUGTN4Ts5wzcQlw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pib/C9qw04U7fpdbALVIRhYGLaPwL/Jd9DpeC6F55dsBz9ByowNv2yaaRIBmpo0Ev
	 qbsaIBugufaOExdJ/C+cPX1LFbl5ryiWQ76MY9yAOopnrZiKcXUU2ySBN9yMgrXlH/
	 BQAhp2w/JXmjvxLEdN8/qpcehocsnRCqTV9bd0X8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23EDEF800F4;
	Wed,  9 Jun 2021 17:10:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7823DF8026C; Wed,  9 Jun 2021 17:10:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D166FF8020D
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 17:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D166FF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="oS5vX5vF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSj8y5K49jv4UfqN4UTLDNrRc66aIDre3vAI/CCwRcWFgDMd2+57OO2irMfRs/gtW5GceRbFRNMNgAbwfovi55evFF/KyzxRFITZXXXSdWLSId61QPTzrT/8j4DR8Q65Noi2GPOez2cvwBvtHSKEv5oJPbTKZEhRBtrDiiVOk3R+q8yOLg1Qie5J/6EmkcW1q1fUvuv1+XrgKs/WxcKsGFsGmjY3PyglHIfvm237zIGH5R5ZwJuK8qpUMgveyyhxqyTBRRVpDfEetWMiaX6cCuGZ8ORoJRVV4CmbXokVBIszlE38NOY1vmDQ2wgK52mO1362F72JyfOr3oOlUqTR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WxEM4irTGbD1qLds/ixE/VBWN1SZUGTN4Ts5wzcQlw=;
 b=LqbUpMfOmlatSV0iYDthpSrBDYa8RJUMrOTs6gRY5QRVHfz+RAM8uDYCWo6KtJVP0D/NnEG4fx7DGGBmYnbOnIvmKDS9/P4B509a7gbWQBzMa5lFZbdKty8e/mHg563AnP+Syf1dha/NMGnWK6I/MKS50nNAIAHpcVFydsn8QU3DG2gtNpyJEFHXkZMHBcUYIaNKbhFcKIlDqhrN1bfHDwzgtwW5/o4ejouRdcanqoKhJ0shGs6UUOLuwzDkgqlXDmeFeO2NP7yJIQjAF9u1+npY1uLh/T8BV9v/Ceq084hhyjLhX+pEeJwjJd9qKV6ooMEvqlLciMCiCWMfPaXN2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WxEM4irTGbD1qLds/ixE/VBWN1SZUGTN4Ts5wzcQlw=;
 b=oS5vX5vFu6mExbI/4xEZcD3xnrVJGB0Sfmp7vnrZ0zRrgVO9/NxIwgTE5OaXtz7Mk/mBPlSIRptNGgKVVDi0vN7abV8VJmDocGjfWT+L6iOZcTEAmus2jpkIBpYbax9+rNxNjzooXc4Sm7zMsRd+BUvSypec9ZswnPY57vji0+EdC2PYRICUEQHSYMV4fzB5sLuc2twJvkfUi60rva8lIB8bI5W2sGOZA1VxIqJd+cT+gQ0wDtjVbA1h6Ar0uHyU4LIaSbQwPbygQmLyhF/CuWztc7acfrVgYPgJL+EIXNLTj8jPgm6aP2RGZgyr1aFvuMdhK9PRjjlr/EQix7RliA==
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=none action=none header.from=nvidia.com; 
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5127.namprd12.prod.outlook.com (2603:10b6:208:31b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 15:10:23 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e%7]) with mapi id 15.20.4219.021; Wed, 9 Jun 2021
 15:10:23 +0000
Date: Wed, 9 Jun 2021 12:10:22 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v4] soundwire: intel: move to auxiliary bus
Message-ID: <20210609151022.GF1002214@nvidia.com>
References: <20210511052132.28150-1-yung-chuan.liao@linux.intel.com>
 <21002781-0b78-3b36-952f-683482a925d7@linux.intel.com>
 <YLS4N2KgzfsMBD1c@vkoul-mobl.Dlink>
 <b316763b-d219-6ea3-401e-3eb9718aabf3@linux.intel.com>
 <YMBHj6PBzeHexXJb@vkoul-mobl>
 <07dbe0a2-0abb-810b-ef39-b83511d3f3e0@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07dbe0a2-0abb-810b-ef39-b83511d3f3e0@linux.intel.com>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BL0PR01CA0016.prod.exchangelabs.com (2603:10b6:208:71::29)
 To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 BL0PR01CA0016.prod.exchangelabs.com (2603:10b6:208:71::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 15:10:23 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lqzqY-004ekB-8R; Wed, 09 Jun 2021 12:10:22 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee8dde3e-3921-4f8c-913a-08d92b58b456
X-MS-TrafficTypeDiagnostic: BL1PR12MB5127:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5127224BEC55B1C71B8D4661C2369@BL1PR12MB5127.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Ny6C3aNdFxtBxAa4ZTCbyv7LfDUajgVZx4Uaqu+qvxy+kn5SyyNyHlaChcD9Tic4WHQA/XXdp2wHzHqcQeoVUDZLys8KZv5ntCfenC63QKQ9XMCh/iTPXRg1KXciRTc1GuMTlRzFxZ9JrX1XOfatC5qFGXHK7sOQ127YCPCTDgrjx2I/kr+iZRHhAYpevlhU8LSQzOfwbyTjMxW0IAuTwrgOyHWbw+CtzH7Dsy+9V/9J/uxtVL9MvO6csz8mGmO1dKRNAS3uwiVC4gEA6BZkecI+3YT2YZsUjFXQAKiz2WGn0jgv2KpsZgeY+sPAayDaRvuywze8Z/Vv0kzaXhZYCpLVjsll9kn5GWgd2X7T1wkXBs20I+ZAxkhPmrndf22FaPGWKuRVRLKfM8Y4Tgki64bin8YINcVDVHzaSAUSyya8AQYlBRiSov6VlV9fsewwVOjMI1TpCjdu8SQPPmoQPqyyasDSHXuGBlC4gSDUl4c2wZCwgMGsg+Ya0UarjWLxTiRKxCaz/sCDeKKA0WwrLdfBmvcZM7p5TgxptpFzVNuYGPW5DAdXhJI7r84MQ2Xa7Ne5jA4MRPJgBY8jZ5hnpBbZqIL0HflODDyLBPD/P0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(8936002)(54906003)(5660300002)(66946007)(8676002)(316002)(66476007)(33656002)(4744005)(1076003)(4326008)(36756003)(9786002)(478600001)(426003)(9746002)(6916009)(2616005)(86362001)(26005)(2906002)(7416002)(66556008)(186003)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qF6HOY9k3DMb8MtqjmJ2Ewq7pFbd+A4MOubjo4v3kuaJUIDYB9ywPDkxCLj+?=
 =?us-ascii?Q?MBw/mZOmrI5z1JWCqIiBKYex3sOAEix2FKPMgQvCtcod9ORfw2D0ddwOuENn?=
 =?us-ascii?Q?zJX+WUrxWV6D7usbVbi5e9l4DM9+KQcdfRk+4dduLqQCfx0O0nyOaEZJ5c20?=
 =?us-ascii?Q?HNUV/slNPfSToVCoPH/41BTVI1frmlBlx4U7H0gGJjyJ9BdZMFe0CQvjlXis?=
 =?us-ascii?Q?vzTWlplUcFE2bz8xgL1hCNCWc1fEAtDl9h+smYrs6OKYtRquTYc4J59/eTYy?=
 =?us-ascii?Q?bYRjEara7EnbXZU/4PncQlFds8S13nFuW91l/pX3q/MrWK0+18SC4VTwpwcF?=
 =?us-ascii?Q?Oo7Y61VrlUdZvcD4QEgZ3bI5vF2VXDMkVs0y1Fd1a1zm53t8mEDkUpTs8EAR?=
 =?us-ascii?Q?Aun3nM3YhVaNWAhzzy8W1j+c05Eno1/4kVLIK5HutbXex/E6s9hXn+cOcp6x?=
 =?us-ascii?Q?trmwkcSeNderFj0ZiPDt7LXUiX19DthzSTMoXEzYJemXnzyXzA+puZvQqTaT?=
 =?us-ascii?Q?3NekCjwXqlk041xFHnGI7WK6h6ZUGKWTdwN1W4JOfPpihVd21xNVq1aket8/?=
 =?us-ascii?Q?35VGbN3+8c/iMkos+ms4aa2Ozd45Ht/i+0XismiOAW+CR6l3y6JbCyLiuzre?=
 =?us-ascii?Q?/C2BmtwALN5PjUgrIUVpPoEZFMQfLesqS5jW8Dy6FjRlLSPjp9MWs33T6jEU?=
 =?us-ascii?Q?fR5ekiWbYmJM5DsouD00ZrKiSFtCSbUpCRaiIkw8LowK+rveZMtweX4KJ0yl?=
 =?us-ascii?Q?pzJya5cFNkCNXOV6rUq5CdtCEWOCxcy9797Kv1z0Ag9RvqNoQuq88Kl4WpNP?=
 =?us-ascii?Q?yjfhz4LL18TLZZ83PyfEdzWzBOvGbQVurB6hnVJXcw8iA5YXkyKetJSWZCp2?=
 =?us-ascii?Q?pX7/aBQlD7erXUg2VF2B06aVNzqd+zPsZjt06E3oE8e1sd6QXc/+K5VgTvSw?=
 =?us-ascii?Q?9snYcImD8oP7Z/aZXRA+l4M6fP3/2psMkReghYS0G1ks9tpQFzaeOLbYsPwP?=
 =?us-ascii?Q?xAr9XTinz7Pds4fFy96Hw20HjL0jVK/v+zrPb89WBAWCxRvjwRDsEulRQb1C?=
 =?us-ascii?Q?zaZeYHyBmwYrh6u7D2Zp7dkdddDzREL8uAE/bUHzgBXluOc07sDX+B1LPJPo?=
 =?us-ascii?Q?eKUTeb+wU5JghBSLFoty/tcukjQa43BAUoky1J5UpbKkko282eTDw3o6tYsb?=
 =?us-ascii?Q?PbrP6u5BIUpvLPaZ5nRViLyf/rCat2nI6cYPKHEeU4QN9E9HDtKW6bE34fAj?=
 =?us-ascii?Q?fOS1ztYkV3f4CisnP3aAmJoYaYCbgLGBMs0aOUKe2qe0hnQdCcKKBwooROZp?=
 =?us-ascii?Q?GUtAgepmF4ralD7Ie/uo5nl/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8dde3e-3921-4f8c-913a-08d92b58b456
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 15:10:23.4156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTFLyfMJnXvepMiJ4qn6ZxyqC1aAZqz/THKUvbrxEFD7T7pQr+jcDQl4Ec5QiJ4T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5127
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 gregkh@linuxfoundation.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com,
 Vinod Koul <vkoul@kernel.org>, Dave Ertman <david.m.ertman@intel.com>,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On Wed, Jun 09, 2021 at 09:44:08AM -0500, Pierre-Louis Bossart wrote:

> The consensus for the auxiliary_device model was hard to reach, and the
> agreement was to align on a minimal model. If you disagree with the
> directions, you will have to convince Nvidia/Mellanox and Intel networking
> folks who contributed the solution to do something different.

The purpose of the aux devices was primarily to bind a *software*
interface between two parts of the kernel.

If there is a strong defined HW boundary and no software interface
then the mfd subsytem may be a better choice.

For a software layer I expect to see some 'handle' and then a set of
APIs to work within that. It is OK if that 'handle' refers to some HW
resources that the API needs to work, the purpose of this is to
control HW after all.

You might help Vinod by explaining what the SW API is here.

Jason
