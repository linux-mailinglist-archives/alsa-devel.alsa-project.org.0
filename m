Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0F51556A0
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 12:25:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 029D3167A;
	Fri,  7 Feb 2020 12:24:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 029D3167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581074749;
	bh=4ZlTLk/l04YmHMECDzuFP6i//nHuo7HRhjg/TB0LH/0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PnHsqzAi1tAu4VVFJdApycCayqt0YfuvQN3iSqbGW8KeAF3Abn4MeXvMXcVgHTa2j
	 ElWxmw1MWsMo8TGziXTJzqnx3z8rEHvKnHzSSK3WK2F3zQ0XpygMaw3o3kTAzDGkBu
	 p+cMw1tVXvXR1ncOjksI9fg8nSBq3rsKxFDBkZWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 169DCF800AB;
	Fri,  7 Feb 2020 12:24:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA5E7F80148; Fri,  7 Feb 2020 12:24:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2EE2F800AB
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 12:23:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2EE2F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="ehVM/iIZ"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3d488f0000>; Fri, 07 Feb 2020 03:22:55 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Feb 2020 03:23:54 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Feb 2020 03:23:54 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Feb
 2020 11:23:49 +0000
To: David Laight <David.Laight@ACULAB.COM>, 'Dmitry Osipenko'
 <digetx@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-5-git-send-email-spujar@nvidia.com>
 <3a586a6b-5f53-dc44-b9fc-67c633c626ef@gmail.com>
 <90ae7badcb3441daa8144233de8f6825@AcuMS.aculab.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <bea2a750-3ef0-21ab-a8ac-d76b6d1a23e0@nvidia.com>
Date: Fri, 7 Feb 2020 16:53:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <90ae7badcb3441daa8144233de8f6825@AcuMS.aculab.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581074575; bh=ZddZAhdQ+7CGcCBN+PpuH4oNPpiNVDulArnMHC1dZrI=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=ehVM/iIZ7eZPVLh7aunXLnqExOarktq9fSo597dkmZXz32g65RggQW3VFIk3s0h5f
 NN3TrRsEuffMhKs4TLRMbwt8o7f+4F7FG7N1kskfmk0uDsCRkUS1PqC0QNfPv+xcpt
 dbmYHdAbwUz/BdLKHgjRgXbo+7F3iBvp77kewxVbmIezWY101ME0vEa9Qd6eUzLq17
 YBSZFjSwqcDK8/mejHIbI5CoCy7q2f3lBZFTNvGvj2hO7wm7i+ewWnUe1Wp7XHwf6b
 Rm3H9D35dIqONnO2T16SJbkVfQcNizG5P39oM2M02FXAuN+nTQMhI94UsiTbo0zxQw
 deDxvOCBNXfiw==
Cc: "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "atalambedu@nvidia.com" <atalambedu@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 spujar@nvidia.com, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "viswanathl@nvidia.com" <viswanathl@nvidia.com>,
 "sharadg@nvidia.com" <sharadg@nvidia.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "rlokhande@nvidia.com" <rlokhande@nvidia.com>,
 "mkumard@nvidia.com" <mkumard@nvidia.com>,
 "dramesh@nvidia.com" <dramesh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v2 4/9] ASoC: tegra: add Tegra210 based I2S
	driver
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

CgpPbiAyLzYvMjAyMCAxMDozNiBQTSwgRGF2aWQgTGFpZ2h0IHdyb3RlOgo+IEV4dGVybmFsIGVt
YWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4KPgo+IEZyb206
IGYgRG1pdHJ5IE9zaXBlbmtvCj4+IFNlbnQ6IDA2IEZlYnJ1YXJ5IDIwMjAgMTY6NTkKPj4KPj4g
MzAuMDEuMjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4+IC4uLgo+Pj4gK3N0
YXRpYyBjb25zdCBpbnQgdGVncmEyMTBfY2lmX2ZtdFtdID0gewo+Pj4gKyAgIDAsCj4+PiArICAg
VEVHUkFfQUNJRl9CSVRTXzE2LAo+Pj4gKyAgIFRFR1JBX0FDSUZfQklUU18zMiwKPj4+ICt9Owo+
Pj4gKwo+Pj4gK3N0YXRpYyBjb25zdCBpbnQgdGVncmEyMTBfaTJzX2JpdF9mbXRbXSA9IHsKPj4+
ICsgICAwLAo+Pj4gKyAgIEkyU19CSVRTXzE2LAo+Pj4gKyAgIEkyU19CSVRTXzMyLAo+Pj4gK307
Cj4+PiArCj4+PiArc3RhdGljIGNvbnN0IGludCB0ZWdyYTIxMF9pMnNfc2FtcGxlX3NpemVbXSA9
IHsKPj4+ICsgICAwLAo+Pj4gKyAgIDE2LAo+Pj4gKyAgIDMyLAo+Pj4gK307Cj4+IHN0YXRpYyBj
b25zdCAqdW5zaWduZWQqIGludD8KPiBPciBnZXQgcmlkIG9mIHRoZSB0YWJsZSBsb29rdXBzIGNv
bXBsZXRlbHkuCj4gQXNzdW1pbmcgdGhlIGluZGV4IGlzIG5ldmVyIHplcm8gdGhlbiB0aGUgdmFs
dWUKPiBjYW4gYmUgY2FsY3VsYXRlZCBhcyAoY29uc3RfYSArIGNvbnN0X2IgKiBpbmRleCkuCgpB
bGwgYWJvdmUgdGFibGVzIGFyZSBtYXBwZWQgdG8gdGVncmEyMTBfaTJzX2Zvcm1hdF90ZXh0W10u
IApBZGRpdGlvbnMvcmVtb3ZhbCBvZiBlbnRyaWVzIHdpbGwgcmVxdWlyZSBjaGFuZ2VzIGluIGVx
dWF0aW9uLiBJdCBpcyAKYmV0dGVyIGtlZXAgdGhlIG1hcHBpbmcgYXMgaXQgaXMuCj4KPiAgICAg
ICAgICBEYXZpZAo+Cj4gLQo+IFJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBS
b2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSwo+IFJlZ2lzdHJhdGlv
biBObzogMTM5NzM4NiAoV2FsZXMpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbHNhLWRldmVsCg==
