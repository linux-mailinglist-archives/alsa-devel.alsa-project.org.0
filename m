Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE30151508
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 05:38:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6BC1169C;
	Tue,  4 Feb 2020 05:37:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6BC1169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580791082;
	bh=wxAuobb/jMIimwndZ0w/Lp0w0wetQX75ZHfcNaOjhIg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vTJ14zFx5jnf4Mdt12VlE2N2bKki2sdnY0nx++jAOfMRiJzUu4YmS3QA2wHyEHoR1
	 ygKreJu47yLxXowdsIMWIhhb9XL14Z/U8zTP0EVmIPDKrMuEq9j2WnP2KzDQ4xWPjy
	 ZxknUI184975UBFuOW4m6Gkx/mX3+vMfw1vjaU7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 113BDF801DB;
	Tue,  4 Feb 2020 05:37:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82ABEF801DB; Tue,  4 Feb 2020 05:37:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3872F80162
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 05:37:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3872F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="palH2y70"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e38f4b70000>; Mon, 03 Feb 2020 20:36:07 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 03 Feb 2020 20:37:03 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 03 Feb 2020 20:37:03 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Feb
 2020 04:36:56 +0000
To: Dmitry Osipenko <digetx@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-6-git-send-email-spujar@nvidia.com>
 <160bb2ca-89bb-0ecf-a334-0fac591b439a@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <cb55a945-b5e2-b0c4-a800-ea045d6a3ba3@nvidia.com>
Date: Tue, 4 Feb 2020 10:06:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <160bb2ca-89bb-0ecf-a334-0fac591b439a@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580790967; bh=8fmyXNKvzaRNq6gyw6oPdbAWkJu99jbcj+jYwwx/UwI=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=palH2y70Jhq6tieJsPsbNDaoX6EZBNuCa0bu/lpxSqBizFfRaYQORQk8Mek1E5wH9
 Nvwn8ePudRxUZmJUJFgRB1eLqEBx25bnM/tRLni+MxYx/v2sMfqbAscykoFqAlHNk7
 QrT4RdiZWdQllpwSDN5FbCEH+m2uf2WDN6crJoNFSnVReuOajcMviJGrL8G0SFFx42
 KEpIMI4Jh2EGbMiKIoYIcN0LT0wMTTX/h2NdZ7aGjp1CLM6q2p5Pet+BaWzjGn+r/S
 33+55f4WXFPj5a8DHHG3QYqZNT68WFUU+Uxw24UDSOvT4va1QFmODZFZ4rpZOYXKSy
 QK6qF/rLK09DQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, spujar@nvidia.com,
 lgirdwood@gmail.com, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 5/9] ASoC: tegra: add Tegra210 based
	AHUB driver
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CgpPbiAxLzMwLzIwMjAgMTA6NTUgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiBFeHRlcm5h
bCBlbWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cwo+Cj4KPiAz
MC4wMS4yMDIwIDEzOjMzLCBTYW1lZXIgUHVqYXIg0L/QuNGI0LXRgjoKPiAuLi4KPj4gKyNpbmNs
dWRlIDxsaW51eC9jbGsuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KPj4gKyNpbmNs
dWRlIDxsaW51eC9tb2R1bGUuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPgo+
PiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4
L3BtX3J1bnRpbWUuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KPj4gKyNpbmNsdWRl
IDxzb3VuZC9zb2MuaD4KPj4gKyNpbmNsdWRlICJ0ZWdyYTIxMF9haHViLmgiCj4gTml0OiBJJ2Qg
c2VwYXJhdGUgdGhlIHBlci1kaXJlY3RvcnkgaW5jbHVkZXMgd2l0aCBhIGJsYW5rIGxpbmUsIGxp
a2UgaXQKPiBkb25lIGJ5IHRoZSBtb3N0IG9mIGV4aXN0aW5nIGRyaXZlcnMsIGZvciBjb25zaXN0
ZW5jeS4KCkkgZG9uJ3Qgc2VlIHRoaXMgYmVpbmcgZm9sbG93ZWQgY29uc2lzdGVudGx5IGZvciBz
b3VuZCBkcml2ZXJzLiBJIHRoaW5rIAppdCBpcyBnb29kIGFzIGl0IGlzLCBpdCBhcHBlYXJzIGNv
bXBhY3QgYW5kIGNsZWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
