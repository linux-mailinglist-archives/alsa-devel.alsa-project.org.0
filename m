Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E58E5D5313
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Oct 2019 00:34:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51E371673;
	Sun, 13 Oct 2019 00:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51E371673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570919677;
	bh=dPQA4ydvOlcRWwrii9JSmPkvlQIposu8ULoZVvx8k4E=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dBCZqxB4FnzYXtj2JzJcdqcmcXYP8bvTn5FCEzOsh7zZvvGwYfUH+1WUqGvSFISQ9
	 mCvLY4LzVOmwmtFReE8I0m2cLur1yvuaxnsiRyCDVtUx83H+qck++gZzR9puZNPA5p
	 OUb9VClTndHsiTDUiyqEzlMjCvYtEPqyb65KjgTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69FE5F8038F;
	Sun, 13 Oct 2019 00:32:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B313DF8038F; Sun, 13 Oct 2019 00:32:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 INVALID_MSGID, MAILING_LIST_MULTI, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from listssympa-test.colorado.edu (listssympa-test.colorado.edu
 [128.138.129.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98B52F80322
 for <alsa-devel@alsa-project.org>; Sun, 13 Oct 2019 00:32:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98B52F80322
Received: from listssympa-test.colorado.edu (localhost [127.0.0.1])
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/sympa) with ESMTPS id
 x9CMWf5r015214
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 12 Oct 2019 16:32:41 -0600
Received: (from root@localhost)
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/submit) id
 x9CMWe22015213; Sat, 12 Oct 2019 16:32:40 -0600
Received: from BYAPR03MB3592.namprd03.prod.outlook.com (2603:10b6:a03:f4::47)
 by BYAPR03MB4376.namprd03.prod.outlook.com with HTTPS via
 BYAPR11CA0106.NAMPRD11.PROD.OUTLOOK.COM; Wed, 9 Oct 2019 20:48:13 +0000
Received: from CY4PR03CA0021.namprd03.prod.outlook.com (2603:10b6:903:33::31)
 by
 BYAPR03MB3592.namprd03.prod.outlook.com (2603:10b6:a02:ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 17:51:57 +0000
Received: from BY2NAM01FT024.eop-nam01.prod.protection.outlook.com
 (2a01:111:f400:7e42::203) by CY4PR03CA0021.outlook.office365.com
 (2603:10b6:903:33::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 17:51:57 +0000
Received: from ipmx4.colorado.edu (128.138.67.75) by
 BY2NAM01FT024.mail.protection.outlook.com (10.152.69.193) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
 id 15.20.2347.16 via Frontend Transport; Wed, 9 Oct 2019 17:51:57 +0000
Received: from mx-spsc.colorado.edu (HELO mx.colorado.edu) ([128.138.67.77]) by
 mx.colorado.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019
 11:10:31 -0600
Received: from ipmx1.colorado.edu ([128.138.128.231]) by mx.colorado.edu with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 10:42:05 -0600
Received: from mx.colorado.edu ([128.138.128.150]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 10:13:26 -0600
Received: from ipmx3.colorado.edu ([128.138.67.74])  by mx.colorado.edu with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 09:55:34 -0600
Received: from mx-spsc.colorado.edu (HELO mx.colorado.edu) ([128.138.67.77]) by
 mx.colorado.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019
 09:48:59 -0600
Received: from ipmx2.colorado.edu ([128.138.128.232]) by mx.colorado.edu with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 09:44:20 -0600
Received: from vger.kernel.org ([209.132.180.67]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 09:36:20 -0600
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S1731180AbfJIPgT (ORCPT <rfc822; michael.gilroy@colorado.edu>);
 Wed, 9 Oct 2019 11:36:19 -0400
Received: from inva020.nxp.com ([92.121.34.13]:49864 "EHLO inva020.nxp.com" 
 rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP        id
 S1728019AbfJIPgS (ORCPT <rfc822;linux-kernel@vger.kernel.org>);        Wed,
 9 Oct 2019 11:36:18 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])        by
 inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1D09F1A019D;        Wed,  9
 Oct 2019 17:36:17 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22]) 
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 105A21A0084;       
 Wed,  9 Oct 2019 17:36:17 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net (fsr-ub1864-103.ea.freescale.net
 [10.171.82.17])        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id
 7C5392060B;        Wed,  9 Oct 2019 17:36:16 +0200 (CEST)
Authentication-Results: spf=none (sender IP is 128.138.67.75)
 smtp.mailfrom=vger.kernel.org; 
 o365.colorado.edu; dkim=none (message not signed)
 header.d=none;o365.colorado.edu; dmarc=fail action=none header.from=nxp.com;
Received-SPF: None (protection.outlook.com: vger.kernel.org does not designate
 permitted sender hosts)
Authentication-Results-Original: mx.colorado.edu;
 dkim=none (message not signed) header.i=none
IronPort-SDR: SURLaPeAy8lpQ/UW0TlgoBpu8BGpnLg4XQ8IiszpOGs8VhlRpQyoBN/bdZiGX6VfTGRCHlQg4x
 4l71Q5lW4n1Zgbt3GwnBqy8521klB7w5w=
IronPort-SDR: 8IyAmDBCTc2WBd9pcHBVwzSvErVxxot2YZhQWHsjCFZnvXZi9yizE+P6H6kiQBZJcdiCGJN0yX
 e+qLx6yRQPg8Dv7CQ71TFeUfe6dHaWPm0=
IronPort-SDR: nHAF/HJ6KtfL/p1GaYWkxP4Ef3u1JSkAhmTtDQFrZRcWgcZpZdLw5gSfxtZKpFZQbrbvWZo7ts
 sledgEO+VTYjgNDfr4FxEKJslbYItgvYw=
IronPort-SDR: ylBJUnyphJjcRqwa4DybXGp2gz0nK7GFFk0ye8vunONgZcZXueSzIcWGwxOIEvPJ7M+15YCcld
 n8Hxw7IoQyiyXuIvBH8eUB7U9H5KGgoRw=
IronPort-SDR: 5l3hT6YnzAYmUeR4yGBnWKkE6qnD9RHfEG30qJ0yJEvzbSCxBO9blXc4y9fuGckuy6buEqeaV5
 tprkyOVMbEAX5YstLJ9olK7Pkle69x+HU=
IronPort-SDR: 2aFnXOb7dDvsPPjormrYAmgD3m0asmurlfitYc32TYRggvh4Ini0wUj8XoDBk0b9WNfaIg0gHS
 mEAwjGglkpXzHOd1WeZn44rM1KG71M80E=
IronPort-SDR: vUF/svq1hQt9KbYZXGMyksK8YoAV/gKiMeU9y48VDkt+nHa7EqbUJUNu9VeXnFn6hFrUuLOe6J
 8twTib8DTETxnUy3BfbgUM6d241L6TEZ0=
IronPort-PHdr: =?us-ascii?q?9a23=3AM5GZohSmJCz8aGSzz50MvVboXtpsv++ubCcI9p?=
 =?us-ascii?q?oqja5Pea2//pPkeXbS/uhpkESXBNfe+7RPjO7RqansXioN7YvS+HwBcZkZUR?=
 =?us-ascii?q?gDhI1WmgE7G8eKBAX9K+KidC01GslOFRdl8ni3PFITGZP4YFvfrw=3D=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3Azrn8qhy6HtKMSyzXCy+N+z0kezQntrPoPwUc9p?=
 =?us-ascii?q?sgjfd0f7+++4j5YhWN4OUrh1jNWp/S5/UChubL4OjsWm0FtJCGtn1KMJlBTA?=
 =?us-ascii?q?QMhshemQs8SNWEBkv2IL+ibyEzEMlYEl4w+Xa9PEU=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3A7GuRuB3x7gaEtgwEsmDT+zVfTzU7u7jyIg8e44?=
 =?us-ascii?q?YmjLQLSKm44pD+JxKGt/B9ylTOWYLB4v5DzefarvOoVW8B5MOHt3YPONxJWg?=
 =?us-ascii?q?QegMob1wonHIaeCEL9IfKrJyw3FchPThlkqne8N0VY?=
IronPort-PHdr: =?us-ascii?q?9a23=3AdUXW7BPyAG1ems8e3PAl6mtXPHoOpqn0MwgJ65?=
 =?us-ascii?q?Eul7NJdOGZ8o//OFDEu6w/iU+PVoLf7OhNh+2Qvqz9CiQM4peE5XYFdpEEFx?=
 =?us-ascii?q?oIkt4fkAFoBsmZQVb6I/jnY21yHMlLWFJ/uXDuN09TFcs=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3Aq4ZN0hAAcj4jsvuQEGg4UyQJPHJ1kqjoPgMT9p?=
 =?us-ascii?q?ssgq5PdaLmxZn5IUjD/qs03lrZG47c7/VegubR9a3sRD9I7ZWAtSUEd5pBH1?=
 =?us-ascii?q?8AhN4NlgMtSMiCFQXgLfHsYiB7VMRPXVNo5Te6ZE5SHsvz?=
IronPort-PHdr: =?us-ascii?q?9a23=3ATtVGsBC+vw1Cy4sIvNLMUyQJPHJ1kqjoPgMT9p?=
 =?us-ascii?q?ssgq5PdaLmxZn5IUjD/qs03lrZG47c7/VegubR9a3sRD9I7ZWAtSUEd5pBH1?=
 =?us-ascii?q?8AhN4NlgMtSMiCFQXgLfHsYiB7VMRPXVNo5Te6ZE5SHsvz?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FDBgCsG55dYU1DioBlhFwpgTsShE2?=
 =?us-ascii?q?JAptthywBAQEBAQEBAQEILQIBAQGHNDgTBQkBAQEDAQICAQUCAQECAgMYFga?=
 =?us-ascii?q?Fa4YoAiAPAUYGCQIkAiYCAgNbF4MdgngEsGGBMoh5gUggbIddhjE/g25zh1K?=
 =?us-ascii?q?CXpZsllsHgiVmBJQjJ5lALY4AmV6BaYF7MxojhAwQFJAYgXmQEwEB?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0H/AQBnDZ5dbeeAioBlHAEBAQEBBwE?=
 =?us-ascii?q?BEQEEBAEBgXuCGwOBQx0ShE2JAptshywBAQEBAQEBAQEILQIBAQGHESM4EwI?=
 =?us-ascii?q?DCQEBAQMBAQECAQUCAQECAhANCwkGK4VAhigCIA8BRgYJAiQCJgICA1sXgx2?=
 =?us-ascii?q?CCwSwZ4EyiHyBSIEMKIc1hFmBWD+DbnOHUoJYBJZollsHgiVmBJQjJ4IqAZc?=
 =?us-ascii?q?VLY4AmV6BaYF7Mxojgz1PEBSQGIF5k10BAQ?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0F+AgAyAZ5dh0pDioBlHAEBAQEBBwE?=
 =?us-ascii?q?BEQEEBAEBgXuCG4FGHRKETYkCm2yHLAEBAQEBAQEBAQgtAgEBAYcRIzgTAgM?=
 =?us-ascii?q?JAQEBAwEBAQIBBQIBAQICEAEBAQoLCQgphUCGKAIgDwFGBgkCJAImAgIDWxe?=
 =?us-ascii?q?DHYILBLA+gTKIe4FIgQwohzWEWYFYP4Nuc4dSglgElmiWWweCJWYElCMngio?=
 =?us-ascii?q?BlxUtjgCZXoFpgXszGiODPU8QFJAYgXmTXQEB?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0E4AgAs/Z1dfU1DioBlhFyBYxKETYk?=
 =?us-ascii?q?Cm2uHLAEBAQEBAQEBAQgtAgEBAYc0OBMFCQEBAQMBAgIBBQIBAQICEAEBCxQ?=
 =?us-ascii?q?IhWmGKAIgDwFGBgkCJAImAgIDWxeDHYILBLBDgTKIfIFIIGyHXYYxP4Nuc4d?=
 =?us-ascii?q?SgliWbJZbB4IlZgSUIyeZQC2OAJlegWmBezMaI4QMEBSQGIF5k10BAQ?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FfAQAs/Z1dh+iAioBlHAEBAQEBBwE?=
 =?us-ascii?q?BEQEEBAEBgXuCG4F1hE2JAptrhywBAQEBAQEBAQEILQIBAQGHESM4EwIDCQE?=
 =?us-ascii?q?BAQMBAQECAQUCAQECAhABAQEKCwkIKYVAhigCIA8BRgYJAiQCJgICA1sXgx2?=
 =?us-ascii?q?CCwSwQ4EyiHyBSIEMKIc1hFmBWD+DbnOHUoJYBJZollsHgiVmBJQjJ4IqAZc?=
 =?us-ascii?q?VLY4AmV6BaYF7Mxojgz1PEBSQGECBOZNdAQE?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FiAQCh/p1dh0O0hNFlHAEBAQEBBwE?=
 =?us-ascii?q?BEQEEBAEBgXuCG4FEMYRNiQKHfJNvhywBAQEBAQEBAQE0AQIBAQGHESM4EwI?=
 =?us-ascii?q?DCQEBAQMBAQECAQUCAQECAhABAQEKCwkIKYVAhigCIA8BRgYJAiQCJgICA1s?=
 =?us-ascii?q?Xgx2CCwSwRIEyiHuBSIEMKIc1hFmBWD+DbnOHUoJYBJZollsHgiVmBJQjJ4I?=
 =?us-ascii?q?qAZcVLY4Am0eBezMaI4M9TxAUkBg/AYE3AQGTXQEB?=
X-IPAS-Result: =?us-ascii?q?A0FDBgCsG55dYU1DioBlhFwpgTsShE2JAptthywBAQEBA?=
 =?us-ascii?q?QEBAQEILQIBAQGHNDgTBQkBAQEDAQICAQUCAQECAgMYFgaFa4YoAiAPAUYGC?=
 =?us-ascii?q?QIkAiYCAgNbF4MdgngEsGGBMoh5gUggbIddhjE/g25zh1KCXpZsllsHgiVmB?=
 =?us-ascii?q?JQjJ5lALY4AmV6BaYF7MxojhAwQFJAYgXmQEwEB?=
X-IPAS-Result: =?us-ascii?q?A0H/AQBnDZ5dbeeAioBlHAEBAQEBBwEBEQEEBAEBgXuCG?=
 =?us-ascii?q?wOBQx0ShE2JAptshywBAQEBAQEBAQEILQIBAQGHESM4EwIDCQEBAQMBAQECA?=
 =?us-ascii?q?QUCAQECAhANCwkGK4VAhigCIA8BRgYJAiQCJgICA1sXgx2CCwSwZ4EyiHyBS?=
 =?us-ascii?q?IEMKIc1hFmBWD+DbnOHUoJYBJZollsHgiVmBJQjJ4IqAZcVLY4AmV6BaYF7M?=
 =?us-ascii?q?xojgz1PEBSQGIF5k10BAQ?=
X-IPAS-Result: =?us-ascii?q?A0F+AgAyAZ5dh0pDioBlHAEBAQEBBwEBEQEEBAEBgXuCG?=
 =?us-ascii?q?4FGHRKETYkCm2yHLAEBAQEBAQEBAQgtAgEBAYcRIzgTAgMJAQEBAwEBAQIBB?=
 =?us-ascii?q?QIBAQICEAEBAQoLCQgphUCGKAIgDwFGBgkCJAImAgIDWxeDHYILBLA+gTKIe?=
 =?us-ascii?q?4FIgQwohzWEWYFYP4Nuc4dSglgElmiWWweCJWYElCMngioBlxUtjgCZXoFpg?=
 =?us-ascii?q?XszGiODPU8QFJAYgXmTXQEB?=
X-IPAS-Result: =?us-ascii?q?A0E4AgAs/Z1dfU1DioBlhFyBYxKETYkCm2uHLAEBAQEBA?=
 =?us-ascii?q?QEBAQgtAgEBAYc0OBMFCQEBAQMBAgIBBQIBAQICEAEBCxQIhWmGKAIgDwFGB?=
 =?us-ascii?q?gkCJAImAgIDWxeDHYILBLBDgTKIfIFIIGyHXYYxP4Nuc4dSgliWbJZbB4IlZ?=
 =?us-ascii?q?gSUIyeZQC2OAJlegWmBezMaI4QMEBSQGIF5k10BAQ?=
X-IPAS-Result: =?us-ascii?q?A0FfAQAs/Z1dh+iAioBlHAEBAQEBBwEBEQEEBAEBgXuCG?=
 =?us-ascii?q?4F1hE2JAptrhywBAQEBAQEBAQEILQIBAQGHESM4EwIDCQEBAQMBAQECAQUCA?=
 =?us-ascii?q?QECAhABAQEKCwkIKYVAhigCIA8BRgYJAiQCJgICA1sXgx2CCwSwQ4EyiHyBS?=
 =?us-ascii?q?IEMKIc1hFmBWD+DbnOHUoJYBJZollsHgiVmBJQjJ4IqAZcVLY4AmV6BaYF7M?=
 =?us-ascii?q?xojgz1PEBSQGECBOZNdAQE?=
X-IPAS-Result: =?us-ascii?q?A0FiAQCh/p1dh0O0hNFlHAEBAQEBBwEBEQEEBAEBgXuCG?=
 =?us-ascii?q?4FEMYRNiQKHfJNvhywBAQEBAQEBAQE0AQIBAQGHESM4EwIDCQEBAQMBAQECA?=
 =?us-ascii?q?QUCAQECAhABAQEKCwkIKYVAhigCIA8BRgYJAiQCJgICA1sXgx2CCwSwRIEyi?=
 =?us-ascii?q?HuBSIEMKIc1hFmBWD+DbnOHUoJYBJZollsHgiVmBJQjJ4IqAZcVLY4Am0eBe?=
 =?us-ascii?q?zMaI4M9TxAUkBg/AYE3AQGTXQEB?=
X-IronPort-AV: E=Sophos; i="5.67,277,1566885600"; d="scan'208"; a="369289467"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="369218796"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="414221540"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="369109215"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="369088567"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="413870168"
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: migi9492@g.colorado.edu
From: "Daniel Baluta" <daniel.baluta@nxp.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Date: Wed,  9 Oct 2019 18:36:13 +0300
Message-Id: 20191009153615.32105-1-daniel.baluta@nxp.com
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
X-MS-Exchange-Organization-ExpirationStartTime: 09 Oct 2019 17:51:57.5674 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 995b79f5-b409-4191-1905-08d74ce1610b
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-Forefront-Antispam-Report: CIP:128.138.67.75; IPV:CAL; CTRY:US; EFV:NLI;
 SFV:SKN; SFS:; DIR:INB; SFP:; SCL:-1; SRVR:BYAPR03MB3592; H:ipmx4.colorado.edu;
 FPR:; SPF:None; LANG:en; ; SKIP:1; 
X-MS-Exchange-Organization-AuthSource: BY2NAM01FT024.eop-nam01.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: colorado.edu
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 995b79f5-b409-4191-1905-08d74ce1610b
X-MS-TrafficTypeDiagnostic: BYAPR03MB3592:|BYAPR03MB3592:
X-MS-Exchange-Organization-SCL: -1
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 17:51:57.3172 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 995b79f5-b409-4191-1905-08d74ce1610b
X-MS-Exchange-CrossTenant-Id: 3ded8b1b-070d-4629-82e4-c0b019f46057
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3ded8b1b-070d-4629-82e4-c0b019f46057; Ip=[128.138.67.75];
 Helo=[ipmx4.colorado.edu]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3592
X-MS-Exchange-Transport-EndToEndLatency: 02:56:17.6796115
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2347.014
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; ex:0; auth:0; dest:I;
 ENG:(750127)(520002050)(944506383)(944626516); 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oT6RHIWv8c9nXcdtkPD1UOt9W/GCCD2mUdXvDEKf+zYucvHZ+e9PjOEG5Pd4?=
 =?us-ascii?Q?tSHsOOShzVDxlEBvK1SbU0eRIvoMB/QKWzSa4R3zIOyeCoJvkqxV/ckJxbyN?=
 =?us-ascii?Q?QiKbKoR5jsMxPgsTx2Tz23vU74lOAYOeE8BhqoCttfTSYMP4STf5ZZV8+YrV?=
 =?us-ascii?Q?P0IDGiXrMudLuTpdoTTj1bD8lmwZKOSdhF7BRu7lQIRjwP27kPPhcICfQesr?=
 =?us-ascii?Q?lnpqrtjLja9MeYMj8BP3rI7HvECReoKEfqpb16V+H0JjO+raE1zmkwgnfZPF?=
 =?us-ascii?Q?4C1aMLh8W/q1TFzc4K1YS5GpXGI1p8cp/wkv0g47UZ2I11xxEqCdrXkzUFs7?=
 =?us-ascii?Q?ZJ5a/0uSe8Pkj2kJEXdiD+QsxDlrDoP+D7uZ9HG/w6oAxatbWB8bj8vC2UrG?=
 =?us-ascii?Q?Gj9ESGVKZ0g7kma3oEaRTFq0eASnZdl0bYSZDRMLdAoF7kSqPjnlx1Nv5e/f?=
 =?us-ascii?Q?j8OglFeher2uf8G9g8WRAMUg68aM4oVs9Zfa2zopwU8os9sNNt+gkzhMwazZ?=
 =?us-ascii?Q?bu3XejALncT39e8fG/WmZtAq/m/9x5ks1V06yVQ+Ozn5vGVsMbrViMerQbTh?=
 =?us-ascii?Q?HTDARWvK5wUbRe/vc3u8hriPxs/vAY4ptgSRCi1TeN+gtGgYvq4bueDhAH57?=
 =?us-ascii?Q?fcEBqafAONv7gmxrPblgXQIcF04yRP3bs4HTcqxIl48oDYZOQd6zeAhAxHeX?=
 =?us-ascii?Q?ICmQ4BzOiYzfhCLCaIqPkLoTsSBkAB/Yp4RO+H9cprH+t/Sd7Ir9dLTXFLUZ?=
 =?us-ascii?Q?49hzKr1Sz2Luq+ILM9VrRkIFgek+D2p95LXLRqV+iPiBRz8edHfRIovRJkbJ?=
 =?us-ascii?Q?+fzzHKHsCdmLVBqEtS6PpS6MvYOgt5R/d/JzMEUt5JRAfSajCV9+4MkMBtmR?=
 =?us-ascii?Q?jzRiLRgT7j0ro3tYmmds9cCpM+i+SiRLTcwyidVOelq/og9nuPInM0F8ysSm?=
 =?us-ascii?Q?DmZzllS0D2ipg6YHlEK+uCA/VA3wmaHqf2HD+sluVIB0EVnf0FBPUFeCTuu3?=
 =?us-ascii?Q?BCNlFfKchEVTSFMtz+IXYtkopCLg0+6sJ7T1yXvdmZUbIGRYlsWvrFIrwqFQ?=
 =?us-ascii?Q?2h05/B58dLN350nAm5uGAQFUqjb44l7U+Rf4jdqGNB3qICXzJCTfirnjWri8?=
 =?us-ascii?Q?VzmAINkJChSLuwFre7KLVwbWd3sN3DUetw=3D=3D?=
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>
Subject: [alsa-devel] [PATCH 0/2] ASoC: simple_card_utils.h: Fix two
	potential compilation errors
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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

For this to happen we symbol DEBUG to be defined.

Daniel Baluta (2):
  ASoC: simple_card_utils.h: Add missing include
  ASoC: Fix potential multiple redefinition error

 include/sound/simple_card_utils.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.17.1


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
