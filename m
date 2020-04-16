Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF781AB78F
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 07:54:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D85BE15F9;
	Thu, 16 Apr 2020 07:54:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D85BE15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587016490;
	bh=L/V/jslQusQGEl1GQyUXReaKbjDejKlH8gDgVNDz50Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n65xTg/LDbqaGqvKdqs2RAMoIQKw9Xng4Tdt4gvkN8k8oE1BqM8YrEI++7GlVkq7d
	 BjZCRWnUGviigKMuq6uKA77MJbfhlfovJZohsFfoo2msq/St081hVxJgSc/cmk9YkV
	 OTDYEx+LV10BVAP8AMpu5DCRd3Wq71Reo0DT5kpU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC909F8016F;
	Thu, 16 Apr 2020 07:53:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AD06F8014E; Thu, 16 Apr 2020 07:53:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A96D1F800AB
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 07:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A96D1F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="jGAKQkR5"
IronPort-SDR: 5YWe0qvpo0YLvKfyGoAv9nHUqr6R65zN9mq8XqOpeBZetSHZbTbTXHC+S7cHUPnlBQpSSX22g6
 nN4krjDgk2oQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 22:52:48 -0700
IronPort-SDR: maQ4k0TS1cHIy1xTNVP4uH3dMXtH5QEh/QNHmVlN5+gzUhERm9fB1rOXPM2WduvYM/OYCgXgA6
 3ZXSuI+O5vaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; 
 d="scan'208,217";a="253751175"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga003.jf.intel.com with ESMTP; 15 Apr 2020 22:52:48 -0700
Received: from fmsmsx163.amr.corp.intel.com (10.18.125.72) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 15 Apr 2020 22:52:47 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx163.amr.corp.intel.com (10.18.125.72) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 15 Apr 2020 22:52:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 15 Apr 2020 22:52:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaLzsVgrKqpjo3nAD/A2hG10SL8rISo2ovmXTfDm1wVPrLfdU7EydN7fWrEi++TFOybgtasPfDsM/akKCnpJIltWX4OK93Wgr1QFOc34P0k+KmlDPE153YjP0ydIXUYWm2D3aP1T6JrB2egCX6wnZqYztv5awCgMrZQ8wnprD4Kiae09nxwD7Z8FnXRlRQwCWxr6mYKkVAS4qB/U5n8T++hqln2BXaKMfhOSo/601TeaMwc1+lvR7CWxtCPu1/VZW48xGr6kTj9272yQj6nTkPvHrYwcehq+R0VhVzqMxdVfCRe8Q7uFDx7ITgDc8k9cJzxVpHYQI+ZoyJHqnQoaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IpA7WkbFBgNdCy3lNeWJ1sps8uhkkLtN7lKYEZ+hZ8=;
 b=QIb7hu+m4HEIP4cGi3XvU1A7l5gCXicP4m4ZKwz4E/uQL7vFkyfp2Bp4QokB/+JYZVzZ68IDNqLxY58xj1xmjWZs5BdZAnpGDC82nZdeeZimnl5yMdKmIZd6g6tbIs3CUc3zwjj/sKf0sk3pOPerjBbIwq8xLF1uoNJQzSiZ/2GRKLVgBahTTaFW+bFQLLmslow9uLzot5yfNdMj+H0SY9Bajcsr6r8qThUrcOTU5pYUS6wEWMt6zIVzj4bFqNOKQMm3D6NOYXl6wMIchJHMcmQ0hy6HDw3OmXtK85mCxNCcQ6hQkJw53eRUFTk34Gz+68yu5pDssHFkyIaLEp2jkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IpA7WkbFBgNdCy3lNeWJ1sps8uhkkLtN7lKYEZ+hZ8=;
 b=jGAKQkR5QhGTciuRz8FXfigZoWxBWH/BcQ0/n1UzchEnUObMv0eTWvlLHcJRyrHLep2/gWfU17wiZFuMT0fkRZlkeAEIX6kwFJyXpr/J1FxYSwFUGGpfuzy2GlRAN2oJpn3exNcbHd/acCLe9sbAwxu8NQK8dU5KBF0pZlxNuw0=
Received: from DM6PR11MB2905.namprd11.prod.outlook.com (2603:10b6:5:62::18) by
 DM6PR11MB3465.namprd11.prod.outlook.com (2603:10b6:5:b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25; Thu, 16 Apr 2020 05:52:45 +0000
Received: from DM6PR11MB2905.namprd11.prod.outlook.com
 ([fe80::fdae:41c5:b91b:b7ec]) by DM6PR11MB2905.namprd11.prod.outlook.com
 ([fe80::fdae:41c5:b91b:b7ec%4]) with mapi id 15.20.2900.028; Thu, 16 Apr 2020
 05:52:45 +0000
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
To: Takashi Iwai <tiwai@suse.com>, Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Question about snd_soc_card_register()
Thread-Topic: Question about snd_soc_card_register()
Thread-Index: AQHWE7HCfFHTKu+2bECdeacoGgJRLw==
Date: Thu, 16 Apr 2020 05:52:45 +0000
Message-ID: <DM6PR11MB29052BDEDBB872123FE6410FE8D80@DM6PR11MB2905.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ranjani.sridharan@intel.com; 
x-originating-ip: [134.191.227.39]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8bf3403-2580-4374-dc7f-08d7e1ca62e8
x-ms-traffictypediagnostic: DM6PR11MB3465:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB346582FFCFDCD8D6744FDA7BE8D80@DM6PR11MB3465.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0375972289
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2905.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(346002)(376002)(136003)(39860400002)(396003)(7116003)(478600001)(110136005)(4326008)(6506007)(66946007)(7696005)(316002)(76116006)(66476007)(66556008)(64756008)(91956017)(66446008)(52536014)(33656002)(71200400001)(86362001)(19627405001)(26005)(186003)(8676002)(107886003)(8936002)(5660300002)(81156014)(9686003)(4744005)(55016002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: folQjB50txJDmqden/Z5rft1e8IMfj4spZVYPQrwzNI4bT5m8xK4Da1kPAGdrKI/TAxrR8WibcGjDNT8qSmZt59xB/t5eGe3Dw1io1QsEl4ouOFxrBqv2lsBD74Iijh+9hKXkRa0GqthSZ5YhhM4iB20Y+5uwOE8Gc51Sn5xpSzaB4hsvZVYo1hFl8c6bew3O5758WLpoQR4Mve7ZDvZs1tTfrR8/+jsyVzq+KN1tr58uaKwChNs4Jn8HEErGrHEcRJEdfMklHi7bEiHLYy29wG/YsjsoVY+Qyp24d9WgJ3Mo+J1gR28G5Z4Z+qTAKvxe0w5OiLcbJ/3W6OJxUaqOiRrfrYfp0Ud80Xz6PYuKASylp8fUaJI8qEaS5cKSnydQNWvgu/IfPXMxRzMRJZl1SCMTmqHnQN0ovq4nhXrU0iyEK58nINrHrBrs+q6/c8L
x-ms-exchange-antispam-messagedata: IHQMjYUKgb3nzKBxmKJxWWopSe5CR+0H5O9tjDyce7CZaFOsYFFZ06Ip2/XzqZSKjZHeXCj17w/K1pDeeM4n02wlWE4WAh3/fDHu07FkIRCGeK+SmEZDW+41Ltk6ieaNRGqtSg30nq3dCyIR6TWWMg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d8bf3403-2580-4374-dc7f-08d7e1ca62e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 05:52:45.4246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oC3sVNmkQQCXBcE5G8P6eKxCfB1PCQD/DU9wYmHCq8ewI40/sASMR0ujAtBnsI09DQ+/5oi3EgbXln4D4QmymhMpR99kqjpq3GGizaqjwaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3465
X-OriginatorOrg: intel.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "Bossart, Pierre-louis" <pierre-louis.bossart@intel.com>
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

Hi Takashi,

While working on implementing the probes features in SOF using a separate c=
ard for the probe DAI links, I noticed that calling snd_soc_register_card()=
  results in
incrementing the usage_count for the device that registers the card by 2 an=
d it is not decremented until the card is freed.

Is this the expected behaviour? Typically, we register a separate platform =
device for the Intel machines which in turn register the card and none of t=
hem ever enable runtime PM. So this has no impact on the parent device's ru=
ntime PM status.

I'd like to avoid creating a separate platform device just to register the =
card if possible while also enabling runtime PM . But when I do this today,=
 the device cannot enter runtime suspend at all. Could you please shed some=
 light on this?

Thanks,
Ranjani
