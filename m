Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 899811F73D2
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 08:18:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B5841686;
	Fri, 12 Jun 2020 08:17:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B5841686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591942683;
	bh=HJtFjcOH0OJbTbAkEILlI/Qr2TTfeAfotRFAd+AsiaQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fztAmT4d4kVUBkbqpASR7uIog4qXCjG0mKxGbgADq/XKeohUWuwfaqRIN093vdpod
	 lwvIwYVFfZJFqL7PpUeZVyVaHXM/lBpvHI1fNcrBd9oCDssiP3jTJdni26CvKFGKc+
	 6JFVtCltrv1vBgsaMQyMX6pmXMCIfQ+09+R9khsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2972F800CC;
	Fri, 12 Jun 2020 08:16:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A410F8021C; Fri, 12 Jun 2020 08:16:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9F49F80058
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 08:16:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9F49F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="K+sn4gF6"
IronPort-SDR: MhNDsiVCHBfpUEPyZyY8WZmdMWQr7tKU6bV51zD6Zd4u4VXEXuH5DWXGsLvtQI6za/Kv/bP2Hk
 kNvf1GayLHxw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 23:16:02 -0700
IronPort-SDR: 3luFmiIe3X4V+MPkUKGxO4cWOxonjOAxi31TJhfyS0YDh5FUIEhuG8UFJJfT3OEe8NPupkgGvW
 kmrNwMsAI16A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,502,1583222400"; d="scan'208";a="260748083"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by orsmga007.jf.intel.com with ESMTP; 11 Jun 2020 23:16:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 11 Jun 2020 23:16:01 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 11 Jun 2020 23:16:01 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 11 Jun 2020 23:16:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 11 Jun 2020 23:16:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lxakwbe/TeLU3OYKIyB6JQSuGTgvamJlTe8Zp7iSOMyaFT9GVtCbG0cLHlBF1TBGSGvElWJxEnvLaItaaUUD45BrSuth2gK81rJKFA0hWcrUDFYBqkGbdyanpfAOuva10gcniyVN8tkAb8BIfqJVk800kGbVU713dhXg0SJmmq5THaEFpS8DPupExvEVnNPzDGDzdwIbVvcZqzcUCEJSpNc+XiCqvFs13HRnHGNL6szScK4J60pqiwFo5IZRMsLgD0WEwh2zzLF7ILiyYIoiJTGF5D23rVH10kJZWaWj8aB1Ayx7IWqYTY5WJdmB5w2Ifx/vxhNSs5PFt2n6dKC2HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0lBjlmXZcLKUJMtdzVWCqpg+RGiOlHN380p4TNOyUA=;
 b=PhuDrHpJdhAtDFgV/R9rivzTNQChN7T9w3MaYTZ7BR6WzARpgMHuuNDIxSNXFVWDa96A4LMQ2cw9N38hNpQ2a+FJG1uKHC/7lN9inUDGz2O1ckdLdy7rdCCQ+uDl5dQ9gPCJDi4aw2W4pgCoQ9w/OQS+OnQQwzrvavfJVO0Pn06V3JhvDYK2FytaYz1QDoGPDq/+ZIcrz1xmM7FiF5jZqbH+brk6t05LE9cxeaeo8R++y1GZ+PEgHg/E5FshIPGONDIU7rX0SU5l4hhqB7lLBS+LbqgdEcZnRFw+n/uPXGZHo3h5n0rdrkXVr/VZfmvzkfl8i0Vw/yJ2EV7uHEpvCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0lBjlmXZcLKUJMtdzVWCqpg+RGiOlHN380p4TNOyUA=;
 b=K+sn4gF66v0F8QBPbds8eVJY+hSXuyKIReivdK0131+INhh08R5Myv5TlwB1oYx4KnbixRDKAJXEdiXdNt1G+LTfm/dDMxZ0pyWTK5JeofaQ2rogVasyUWE9C80+6XYqPPe82O/HpArig7cLWoJl9tMQcVa0bRZ9gUs1NHn26HE=
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM6PR11MB2586.namprd11.prod.outlook.com (2603:10b6:5:c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 06:15:59 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::b4fa:727e:34a9:b1a4]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::b4fa:727e:34a9:b1a4%5]) with mapi id 15.20.3066.023; Fri, 12 Jun 2020
 06:15:58 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: [PATCH] ASoC: SOF: Intel: hda: unsolicited RIRB response
Thread-Topic: [PATCH] ASoC: SOF: Intel: hda: unsolicited RIRB response
Thread-Index: AQHWP/c4ukUWDBOd20aRgUpUZ24R5KjTeMYAgAAAtZCAADqtAIAAy8xA
Date: Fri, 12 Jun 2020 06:15:58 +0000
Message-ID: <DM6PR11MB4316E9E9E965C123E797210E97810@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1591883073-17190-1-git-send-email-brent.lu@intel.com>
 <b7e0b822a9deea506acaa40e0e31cc9f488bb446.camel@linux.intel.com>
 <DM6PR11MB4316108BCF449D52E49C7E4297800@DM6PR11MB4316.namprd11.prod.outlook.com>
 <s5h5zbxeb5t.wl-tiwai@suse.de>
In-Reply-To: <s5h5zbxeb5t.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [36.230.210.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1b523e8-dbd1-4dec-2321-08d80e981303
x-ms-traffictypediagnostic: DM6PR11MB2586:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB25867FB39D97212621641B6497810@DM6PR11MB2586.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PAf4Yh/vjzDrq/iu/oL2K7A00X6x0WlX5DnF9EXTsOJcmR+DF06xGHtAr0mCJITrcU80TDCJd0JvA/e3y2qt1NXzS2L4Rzb7NU5OYkxXcbreTF9seUPnQ1JF91+f8+X8nII/jECbsFn2B9attRmViFTZCdHAkqK6bTIvVvZC5E/8+83pjQw8BBuspXELGFXmaAWMz5ENiBGIdoz2kwigZelxIKr6GFfqPH99j0FJtQCnor48QxkNxSVVIFufsCSOQTvVBSBqL2SuYqWDZqgPCVEjd+xoUQ9zJAwILXCwzRe8Qg+9CEuDDrqV3byUZufrebCPNXFCKGKEUUPytGz4tA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4316.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(136003)(396003)(376002)(346002)(39860400002)(4744005)(6916009)(52536014)(54906003)(55016002)(8936002)(33656002)(316002)(7696005)(71200400001)(66476007)(6506007)(2906002)(66946007)(8676002)(66446008)(9686003)(83380400001)(4326008)(66556008)(86362001)(76116006)(7416002)(26005)(186003)(5660300002)(478600001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 9iB0tpFYuLHsQeSZb1lvIolMvFQ/oDDhhd4u1OOhV6Iq3Ahh1qFlbBZmH3KdwOJOQdVe+eylxDVOkV6qAucgu3Qcgo+4FLK8q+6X4dCVwduNh1EuztBft4hJB2pbF/g+R/01Tv2nYNUHa099xk/qMegJr+HgzXhZltSVjPjz0YuYCEeDfHAtCS7It/wv430jgdxb7i7GRLJZrMuvUQ9nOd2RMH9UO540fTxkXz5QvSXbrTVtb+EX1wlIaUlFykegBCza7n9MRU3lm6YJuPoLsCpxY7xdb0GVWJ7qTYXZGgJPir2Cf9ifsG4O2bgQz6gG10PjRvB8hUmoDLmxR7e7fgasxmyLR1mT0ms3tlxRSJFvow5NaTMilxur7LmCwSPqOayBenGHmWDWBAp9pjnupLIegGrJiVHkTqzSHgrRVRD8DihkeqaXZJnL7zAXArukrmrwlfwcc0SltCsrG2LtqN9tcNgZr4v80dCroNTi7ngI5VZ+TcD4mnL01dDLzt3e
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b523e8-dbd1-4dec-2321-08d80e981303
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 06:15:58.6897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xkU+IJO8TfQWZX9ecXcEcat/HsQNAhsxcrRcxeagEcCzTLCas5G4rnynMQry0NoOx2Aj9WA/usqBZ5oBTPnBkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2586
X-OriginatorOrg: intel.com
Cc: Pierre-Louis Bossart DRIVERS <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "sound-open-firmware@alsa-project.orgDRIVERS"
 <sound-open-firmware@alsa-project.orgDRIVERS>, "commit_signer:6/16=38%,
 authored:6/16=38%, added_lines:123/248=50%, removed_lines:36/84=43%, Kai
 Vehmanen DRIVERS \)" <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Keyon Jie <yang.jie@linux.intel.com>, "authored:2/16=12%,
 added_lines:21/248=8%, removed_lines:5/84=6%, \), Liam
 Girdwood DRIVERS \)" <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, "Daniel Baluta DRIVERS
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

>=20
> Now I noticed that the legacy driver already addressed it recently via co=
mmit
> 6d011d5057ff
>     ALSA: hda: Clear RIRB status before reading WP
>=20
> We should have checked SOF at the same time, too...
>=20
>=20
> thanks,
>=20
> Takashi

Hi Takashi-san,

Yes you are correct. I tested Chrome v5.4 on a CML Chromebook 'hatch' and
realize the SOF does no suffer from this issue because the 'sync write' fea=
ture
is enabled in hda_init. Soon I can reproduce the issue after turning it off=
. So I
think it's still worthy to have this fix in case we need to disable 'sync w=
rite'
someday.


Regards,
Brent

