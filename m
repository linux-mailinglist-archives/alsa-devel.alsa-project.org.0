Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3154EE097
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 14:05:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8053E176E;
	Mon,  4 Nov 2019 14:04:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8053E176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572872729;
	bh=yhqn96kGTQ4LS4gcZeyJtKiFEPE9Vj2zbQx8Tt8/BIw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tZbtUK2tqyipkQ5vftoQ+QhqFcvABBy91gdghLOX7Fp3PnA9pZiy1gdG30WwTSDNI
	 /fimgxuJTkn5DeXVQy26Vt3gpilRS6ccCfYMaoo2f/WnnOLLTT6o3zTCcgngPrvfE1
	 x/cx9+4gqGfIeJufRkDX9lwcWnDjaB4cvyLG0jzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C586F803F4;
	Mon,  4 Nov 2019 14:03:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17484F803F4; Mon,  4 Nov 2019 14:03:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_SPF_HELO,SPF_HELO_PASS autolearn=disabled version=3.4.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE811F8019B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 14:03:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE811F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="rh1E36cx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QK2A44qFscdVfENaZO/mY8yS+moEA7R6cu5a6P0omtExneA3gQgFXNKIywxR3LonSdRB0xJ7Zvwu42ilf1PIhfz0+Umgs4qVahl4+Jc5bjrWt6h+ybz1gqi7xn2NUNxuF7lN4Sq2v0dELkuQMJzvzdNfq1hGg8mH9XQ03E3COQS9gFNi1NEef2ewXRouOUfzVcNX8HalCYyisr9J/1dSSCU1uUJyyVpYVKGMJXVzHQsP+DX790bIevFa6ryMfrx1jautdYANAu/gZNa0JgAi6N7shwQbjeJXBoerNSH6y96QHUKBb+kNdNZ2ttk2L8A3HrPUhu1Z+xIQPX+WinZpnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3721xjqmz1B8JrA8vKVeHuk2WS/8E4begtq6byGeq3I=;
 b=Speuk7fhfx1fH//qFZw8WWErBY12YZ8/8NkvRxB9Xg8g8vGs8BGJa6dnyJMfs37gP8Z0wELrNhMmO+4KgO+GlEp8gi/Ypv5SX9r2EbI6ZMmB534BN2aTGOSpYWlRj+2g922D0mlcDtJAma/ZgFYAOROVDF7wKcOZC+4QzATbD7N438HQtXuXFrwv9X0sgtMvsVOBJoDn/Trf0x9DOw79UuO0/Sws7lp0ZorOq16WL0QpgpXdrsRHsB+aNnxNyC/+gzO29cMwdcIIhHHQpUgT+gUiU7UAl/ldIxFPuftKFqJSqY3KHMNzt4CWZWyTkgXVYOR5VKfsBgtIcRCtkiui4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3721xjqmz1B8JrA8vKVeHuk2WS/8E4begtq6byGeq3I=;
 b=rh1E36cxvUYN8whO4FW9i0xTb2wKX8LcfgUwZcywJL5G1bserg63TpTJe+Yu1l1HXxsPhw1+fNed0io73PinopITlAHwSUX/k55nu6ZIoWzjOnRRG+hGjunDqmNwSeo3zjmWRT2/wglSqRJB+f53+u4p0CLrzvARQ1+RmkNA3Nc=
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com (52.133.13.160) by
 VI1PR04MB3054.eurprd04.prod.outlook.com (10.170.225.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Mon, 4 Nov 2019 13:03:38 +0000
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::b835:b58c:26b2:ca8f]) by VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::b835:b58c:26b2:ca8f%7]) with mapi id 15.20.2408.024; Mon, 4 Nov 2019
 13:03:38 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "yong.zhi@intel.com"
 <yong.zhi@intel.com>, "broonie@kernel.org" <broonie@kernel.org>
Thread-Topic: [alsa-devel] [PATCH] ASoC: max98373: Fix calls to free_gpio()
Thread-Index: AQHVkNdblQZtOZQk3Ue/VsbeJito9ad6/tyA
Date: Mon, 4 Nov 2019 13:03:38 +0000
Message-ID: <5a2369b1804db60da9ee10d4a2fa0688ff9f1222.camel@nxp.com>
References: <1572628130-16955-1-git-send-email-yong.zhi@intel.com>
In-Reply-To: <1572628130-16955-1-git-send-email-yong.zhi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5e98be18-d94b-413b-2df1-08d761276892
x-ms-traffictypediagnostic: VI1PR04MB3054:
x-microsoft-antispam-prvs: <VI1PR04MB30540F7A9FED2445CB5199A1F97F0@VI1PR04MB3054.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0211965D06
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(199004)(189003)(86362001)(6116002)(36756003)(486006)(50226002)(558084003)(14444005)(8936002)(14454004)(44832011)(11346002)(476003)(2616005)(6486002)(446003)(76176011)(102836004)(4326008)(71190400001)(6506007)(71200400001)(229853002)(186003)(478600001)(26005)(316002)(7736002)(8676002)(3846002)(66066001)(2201001)(118296001)(256004)(6436002)(54906003)(110136005)(66446008)(25786009)(305945005)(2501003)(64756008)(66556008)(66476007)(76116006)(66946007)(91956017)(5660300002)(6246003)(81156014)(81166006)(99286004)(6512007)(2906002)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB3054;
 H:VI1PR04MB4094.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 20tCLUR4WqApmzLwPUlzocbdnjuK79A1j95rACFHebKKpH0FqN/oNkpwTTjC0VpZ2gFUV4tv80A3UX20a86cXpHXhgro5Gwxqg6Gv4Jnfn2cGbKOKdGKDYQ1gnwkzKwDxY2WXwyftUZXRPXVMCJCFpwq8R1bANYDakabwWbFzLxW9TTCzuucYHoJdUhfPV+RbAW0bVXfQ4UdCBE0Gh1FFIif3JnWYPUkjgwQrfFKY7K3Lmcz5JgFQBhokxBCyHbkACnktDDX+yy8WPQMLYbpyhHFQfk84H2NS2c+jAbrM12lv739xCqfgVdyouy5NF4nXCH9qwR1k7UKMjot01FyRzsZPn/zevQUUc8YmimDwhoKb4HwoeHTtG7n4cz+MNC6WtOJkLrPxRrsCZOSR66kF5+9XGXdKFtgOv3Gs7avh6323/b+Y/TpFG0VQo54FzOD
x-ms-exchange-transport-forked: True
Content-ID: <688A537AC976D843B9F7412F66F3A4ED@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e98be18-d94b-413b-2df1-08d761276892
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2019 13:03:38.0934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Y6UDr4vouhiEBxFH72zfkQtX2Fq4lOqdrKqWKep0UglePMpjN74z1xcA9hriPHM8GxSavAUPW6CEEvaplk1Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3054
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "sathyanarayana.nujella@intel.com" <sathyanarayana.nujella@intel.com>,
 "ryans.lee@maximintegrated.com" <ryans.lee@maximintegrated.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: max98373: Fix calls to free_gpio()
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

Hi Yong,

On Fri, 2019-11-01 at 12:08 -0500, Yong Zhi wrote:
> Don't Call free_gpio() when request_gpio() fails, call it
> at error paths to avoid resource leak.
> 

Uosing devm_gpio_request will make the change cleaner.
What do you think?

thanks,
Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
