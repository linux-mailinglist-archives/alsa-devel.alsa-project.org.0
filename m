Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 091E11F6C9C
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 19:11:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86A9A1689;
	Thu, 11 Jun 2020 19:10:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86A9A1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591895467;
	bh=5mnBUpxwAJIl0Lta3/TwT0gmpqAakW+foaTSLphUolY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ExrszHLPFhTyRNVkBWpibkOZIw62fhVXlFcBv2Rdw8KUywwtCqm0+Ij/AZoz6B6Jo
	 Z5ROVH9KhJNuwSpRYsDyFLwSSOiB9i9o6koy8pUA/2tQNDQJEKMFlGPVPJH7ji4T8F
	 g0iIzd80yjSf7qocD21LifcmJbPZI+Gc/Bz0pyIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8BC6F8028D;
	Thu, 11 Jun 2020 19:09:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CF6AF8028C; Thu, 11 Jun 2020 19:09:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_13,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28B94F80149
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 19:09:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28B94F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="ZnYaCeqi"
IronPort-SDR: tHo3HZT4zIlULIMgqr7PVZ3GjKrALhm93zPoTkTImAPchpnsWrGWL+kO/mb7VfAigcrsn+z5Ts
 UsIQwUO4b3JQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 10:09:12 -0700
IronPort-SDR: cYs0/HrAopmT+1KIrDhp1Bq2RB3YAnPLs5cp8LfvDG6kgVPoyFiGmD2at4JHTAcIXKZKvFMc6n
 ca6paDXdW9yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,500,1583222400"; d="scan'208";a="260742104"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga008.fm.intel.com with ESMTP; 11 Jun 2020 10:09:12 -0700
Received: from fmsmsx151.amr.corp.intel.com (10.18.125.4) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 11 Jun 2020 10:09:12 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX151.amr.corp.intel.com (10.18.125.4) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 11 Jun 2020 10:09:11 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.53) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 11 Jun 2020 10:09:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGKV0Kx3lo/7MWz2tnOweqlMOb6sKdonLkM45XvWkQeTgR/FH3moANivq25QXkoZdZVuS3HCWNEZc8E3yJI9YVdxy0+VdEw6DnfWFV0/Z3GMFBaYbZjI1x6ygCUIBrekp3oDwhJ3q5MtkZsQQnY2mbgGrmPciHkqfUMLJ68vgn5bIMo4jQ/oOfGWP4lSuHaSOXCFLRanZjtvYj2dLOeun/VYjeDnDXjtwj++6Ti5+1dljiyHxP9MsjX4fTIGNtf9bjX2t6HwygfsbyS+QgCknQ2QpU+RyHxPHm8+8ZGqrssJ65x9Qb6r6klItTuGbpOEXiHYSGQUopn/3vyTfTTADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mnBUpxwAJIl0Lta3/TwT0gmpqAakW+foaTSLphUolY=;
 b=XLAs4KVrZ6R6hg4T1BZexV0gLOsfCADXVb2ugbTvN28b0WFjm/hi1MjJqZCCGjjChlPU4Ynl6fSozt7bZPeNSAj2EZxEqOe6JkM+98o2agQkEhD8blBYbnMmHz3RuBW4dHcIgpw6tK6la7IdVSi5qWm9qYrDzyjYyVm1Shvzv5+bG+q340JbCLek2c4kbqfGxXuoFgURGJ4yAfWCXq53PpQPkBZG4SSnO6D8b/Du634VZT2JSQGuj3FYkvE8NuKxQtB7BeAGFC27vPmKZWBJiwTe4W7DUke02jxcbVR9Twrh/PqedK1DQ66uWsimy/Zlk2GHfdTL9xTYj0JxkRvFKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mnBUpxwAJIl0Lta3/TwT0gmpqAakW+foaTSLphUolY=;
 b=ZnYaCeqiPtzQve4vvrDYJaYQ8wgihpRDgjRUHueJs6k3xST3Wg/eknggMNx4A9LlToSAdjQzhdwG6aifIcDK0AMwkvOxXx8yHj6Mz6jTw/ZfwiItiRpMgLUF5Q7tF01pOWZAVtcQTYXiqkz61IqsW42p9qLSDGw+OqiAwsltl4E=
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM6PR11MB4708.namprd11.prod.outlook.com (2603:10b6:5:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19; Thu, 11 Jun
 2020 17:09:09 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::b4fa:727e:34a9:b1a4]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::b4fa:727e:34a9:b1a4%5]) with mapi id 15.20.3066.023; Thu, 11 Jun 2020
 17:09:08 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: SOF: Intel: hda: unsolicited RIRB response
Thread-Topic: [PATCH] ASoC: SOF: Intel: hda: unsolicited RIRB response
Thread-Index: AQHWP/c4ukUWDBOd20aRgUpUZ24R5KjTeMYAgAAAtZA=
Date: Thu, 11 Jun 2020 17:09:08 +0000
Message-ID: <DM6PR11MB4316108BCF449D52E49C7E4297800@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1591883073-17190-1-git-send-email-brent.lu@intel.com>
 <b7e0b822a9deea506acaa40e0e31cc9f488bb446.camel@linux.intel.com>
In-Reply-To: <b7e0b822a9deea506acaa40e0e31cc9f488bb446.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [36.230.210.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90277393-a5a1-4461-3748-08d80e2a27a3
x-ms-traffictypediagnostic: DM6PR11MB4708:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB47086937973A1D81A4D5411E97800@DM6PR11MB4708.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0431F981D8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P9ZBdqt4PeY8oGna+bR/tSdjd0eRFywxYK5OSg2HAOYKnDvUcWNdIWoFGUuXOuIyB4/Fp0ajOgiDdS6asHeKvT5/bQd8P0lDp946nHdmAaZ99vN7pdxzWr3z8NNbvD7ZZm6M2E5yp3rOH2sZ4KoEFEvZbg9ViyxFbbQpDpvyvokRtOADaAJVR1ViCPkPuiCzwU2nc32+MTd9cLGfS6pi8mz9kZ2msHjR1c/8PvstZ3gFFztf1A1O+Um2mGCV4oyZ9exjKpgZ0bDDz6KJf+Eia/RxNLHRstUo9ORfi01wChuPGSX2adSVWh0oA1QeTtXVMcJFVxj4+VnWNVUi/NZxkA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4316.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(396003)(39860400002)(376002)(346002)(366004)(66946007)(2906002)(66476007)(64756008)(71200400001)(66446008)(83380400001)(66556008)(8676002)(52536014)(33656002)(76116006)(478600001)(86362001)(7696005)(110136005)(8936002)(54906003)(7416002)(6506007)(55016002)(316002)(186003)(26005)(4326008)(5660300002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: yZ8+MihdDRxdPVPytpTuEEnVHwqWBtV33/+zhb/nYaPJpfYkSPGtVqOjvr2fhJth/Aw8QqGzbxNXFXp88aZakoec2Ouq52TKchN/ZaIuPT2KLmDYq7ABkzyfdlzwDPksMVJUg2e7lMRkzRvfP66QTYjhkQDJzcOWbHqy0ZNkxtaiKDR2//ppdRafBmr6egtKsQmwE7xWgbRWlNewq5yv+q3XeaKbT6dDbFv3+HmH4pU15rtuacg5lhPJUFKVzV0kO1yX39vs/e/dI20L/NVg//km+FZXb2W0rZNe0+DfKrj7rckoZ8oRIXov5YrDKKiBcbmnB7Nrd7Jrh+Suutfm5O7Zn2lhG0iKjDi43NZI0z0nKZbA7Z6nclZOvhr02Bncs1sX395Cx82udKOsTYPbAJjOFNlzNIbsQUp43RFK8AXbeydxcrIJxpvqEUa0GfCheiu0OwsfmdWqbVxsa3U+VeCNXvme+iv66htW1hE8/MlWOZv5CJoc6WDEIJfFu9U3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 90277393-a5a1-4461-3748-08d80e2a27a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2020 17:09:08.8029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PvbKM3xWzr0LVo9p+BSTetQlXSEMRy77ZL8WyMuCBxafznSUKyxLamZSf/zClIJtEE+2SSC/41EI8mExMmGOhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4708
X-OriginatorOrg: intel.com
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>, "commit_signer:6/16=38%,
 authored:6/16=38%, added_lines:123/248=50%, removed_lines:36/84=43%, Kai
 Vehmanen DRIVERS \)" <kai.vehmanen@linux.intel.com>, "authored:2/16=12%,
 added_lines:21/248=8%, removed_lines:5/84=6%, \), Liam
 Girdwood DRIVERS \)" <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart DRIVERS <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 "sound-open-firmware@alsa-project.orgDRIVERS"
 <sound-open-firmware@alsa-project.orgDRIVERS>, "Daniel Baluta DRIVERS
 \)" <daniel.baluta@nxp.com>, Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

PiBIaSBCcmVudCwNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLiBJcyB0aGlzIGZpeCBmb3Ig
YSBzcGVjaWZpYyBpc3N1ZSB5b3UncmUgc2VlaW5nPw0KPiBJZiBzbywgY291bGQgeW91IHBsZWFz
ZSBnaXZlIHVzIHNvbWUgZGV0YWlscyBhYm91dCBpdD8NCj4gDQo+IFRoYW5rcywNCj4gUmFuamFu
aQ0KDQpIaSBSYW5qYW5pLA0KDQpJdCdzIHJlcG9ydGVkIHRvIGhhcHBlbiBvbiBHTEsgQ2hyb21l
Ym9vayAnRmxlZXgnIHRoYXQgc29tZXRpbWVzIGl0DQpjYW5ub3Qgb3V0cHV0IHRoZSBhdWRpbyBz
dHJlYW0gdG8gZXh0ZXJuYWwgZGlzcGxheS4gVGhlIGtlcm5lbCBpcw0KQ2hyb21lIHY0LjE0IGJy
YW5jaC4gRm9sbG93aW5nIGlzIHRoZSByZXByb2R1Y2Ugc3RlcCBwcm92aWRlZCBieQ0KT0RNIGJ1
dCBJIGNvdWxkIHJlcHJvZHVjZSBpdCBzaW1wbHkgcnVubmluZyBhcGxheSBvciBjcmFzX3Rlc3Rf
Y2xpZW50DQpzbyBJIHRoaW5rIGl0J3Mgbm90IGFib3V0IHRoZSBjYWJsZSBwbHVnL3VucGx1ZyBo
YW5kbGluZy4NCg0KV2hhdCBzdGVwcyB3aWxsIHJlcHJvZHVjZSB0aGUgcHJvYmxlbT8NCjEuICAg
ICAgUGxheSBZb3VUdWJlIHZpZGVvIG9uIENocm9tZWJvb2sgYW5kIGNvbm5lY3QgaXQgdG8gZXh0
ZXJuYWwgbW9uaXRvciB3aXRoIFR5cGUgQyB0byBEUCBkb25nbGUNCjIuICAgICAgUHJlc3MgbW9u
aXRvciBwb3dlciBidXR0b24gdG8gdHVybiBvZmYgdGhlIG1vbml0b3INCjMuICAgICAgUHJlc3Mg
bW9uaXRvciBwb3dlciBidXR0b24gYWdhaW4gdG8gdHVybiBvbiB0aGUgbW9uaXRvcg0KNC4gICAg
ICBDb250aW51ZSB0byBwbGF5IFlvdVR1YmUgdmlkZW8gYW5kIGNoZWNrIGF1ZGlvIHBsYXliYWNr
DQo1LiAgICAgIE5vIHNvdW5kIGNvbWVzIG91dCBmcm9tIGJ1aWx0LWluIHNwZWFrZXIgb2YgZXh0
ZXJuYWwgbW9uaXRvciB3aGVuIHR1cm4gb24gZXh0ZXJuYWwgbW9uaXRvcg0KDQpJIGFkZGVkIGRl
YnVnIG1lc3NhZ2VzIHRvIHByaW50IHRoZSBSSVJCV1AgcmVnaXN0ZXIgYW5kIHJlYWxpemUgdGhh
dA0KcmVzcG9uc2UgY291bGQgY29tZSBiZXR3ZWVuIHRoZSByZWFkIG9mIFJJUkJXUCBpbiB0aGUN
CnNuZF9oZGFjX2J1c191cGRhdGVfcmlyYigpIGZ1bmN0aW9uIGFuZCB0aGUgaW50ZXJydXB0IGNs
ZWFyIGluIHRoZQ0KaGRhX2RzcF9zdHJlYW1faW50ZXJydXB0KCkgZnVuY3Rpb24uIFRoZSByZXNw
b25zZSBpcyBub3QgaGFuZGxlZCBidXQNCnRoZSBpbnRlcnJ1cHQgaXMgYWxyZWFkeSBjbGVhcmVk
LiBJdCB3aWxsIGNhdXNlIHRpbWVvdXQgdW5sZXNzIG1vcmUNCnJlc3BvbnNlcyBjb21pbmcgdG8g
UklSQi4NCg0KWyAgIDY5LjE3MzUwN10gc29mLWF1ZGlvLXBjaSAwMDAwOjAwOjBlLjA6IHNuZF9o
ZGFjX2J1c19nZXRfcmVzcG9uc2U6IGFkZHIgMHgyDQpbICAgNjkuMTczNTY3XSBzb2YtYXVkaW8t
cGNpIDAwMDA6MDA6MGUuMDogc25kX2hkYWNfYnVzX3VwZGF0ZV9yaXJiOiBjbWRzIDEgcmVzIDAg
cnAgMjEgd3AgMjENCj0+IGhhbmRsZSB0aGUgcmVzcG9uc2UgaW4gc2xvdCAyMQ0KWyAgIDY5LjE3
MzU3MF0gc29mLWF1ZGlvLXBjaSAwMDAwOjAwOjBlLjA6IHNuZF9oZGFjX2J1c191cGRhdGVfcmly
YjogdXBkYXRlZCB3cCAyMg0KPT4gbmV3IHJlc3BvbnNlIGluIHNsb3QgMjIgYnV0IG5vdCBoYW5k
bGVkDQpbICAgNzAuMTc0MDg5XSBzb2YtYXVkaW8tcGNpIDAwMDA6MDA6MGUuMDogc25kX2hkYWNf
YnVzX2dldF9yZXNwb25zZTogdGltZW91dCwgd3AgMjINClsgICA3MC4xNzQxMDZdIEhETUkgSERB
IENvZGVjIGVoZGF1ZGlvMEQyOiBjb2RlY19yZWFkOiBmYWlsIHRvIHJlYWQgY29kZWMNCg0KSSBm
b3VuZCB0aGVyZSBpcyBhIGNvbW1pdCBhZGRyZXNzaW5nIHRoaXMgaXNzdWUgYW5kIGNoZXJyeS1w
aWNrIGl0IHRvIHRoZQ0KQ2hyb21lIHY0LjE0IGJ1dCB0aGUgaXNzdWUgaXMgc3RpbGwgdGhlcmUu
IEkgdGhpbmsgbW9yZSBsb29wIGRvZXMgbm90IGhlbHANCmJlY2F1c2UgZXZlbnR1YWxseSB0aGVy
ZSB3aWxsIGJlIHJlc3BvbnNlIGNvbWluZyBpbiB0aGUNCnNuZF9oZGFjX2J1c191cGRhdGVfcmly
YigpIGZ1bmN0aW9uIGFuZCBiZWNvbWUgdW5oYW5kbGVkIHJlc3BvbnNlDQppbiB0aGUgbGFzdCBs
b29wLg0KDQpjb21taXQgNjI5N2EwZGM0YzE0YTYyYmVhNWE5MTM3Y2VlZjI4MGNiN2E4MDY2NQ0K
QXV0aG9yOiBSYW5qYW5pIFNyaWRoYXJhbiA8cmFuamFuaS5zcmlkaGFyYW5AbGludXguaW50ZWwu
Y29tPg0KRGF0ZTogICBXZWQgSnVuIDEyIDEyOjIzOjQwIDIwMTkgLTA1MDANCg0KICAgIEFTb0M6
IFNPRjogSW50ZWw6IGhkYTogbW9kaWZ5IHN0cmVhbSBpbnRlcnJ1cHQgaGFuZGxlcg0KDQogICAg
TW9kaWZ5IHRoZSBzdHJlYW0gaW50ZXJydXB0IGhhbmRsZXIgdG8gYWx3YXlzIHdha2UgdXAgdGhl
DQogICAgSVJRIHRocmVhZCBpZiB0aGUgc3RhdHVzIHJlZ2lzdGVyIGlzIHZhbGlkLiBUaGUgSVJR
IHRocmVhZA0KICAgIHBlcmZvcm1zIHRoZSBjaGVjayBmb3Igc3RyZWFtIGludGVycnVwdHMgYW5k
IFJJUkIgaW50ZXJydXB0cw0KICAgIGluIGEgbG9vcCB0byBoYW5kbGUgdGhlIGNhc2Ugb2YgbWlz
c2VkIGludGVycnVwdHMgd2hlbiBhbg0KICAgIHVuc29saWNpdGVkIHJlc3BvbnNlIGZyb20gdGhl
IGNvZGVjIGlzIHJlY2VpdmVkIGp1c3QgYmVmb3JlIHRoZQ0KICAgIHN0cmVhbSBpbnRlcnJ1cHQg
aGFuZGxlciBpcyBjb21wbGV0ZWQuDQoNCg0KUmVnYXJkcywNCkJyZW50DQoNCg==
