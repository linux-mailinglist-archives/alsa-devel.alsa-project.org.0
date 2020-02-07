Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC36E1556A2
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 12:26:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80F40168B;
	Fri,  7 Feb 2020 12:25:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80F40168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581074792;
	bh=K3/qoYcKI/LwDQjDxrdHuVFxzDJ9lofIEQB9ufW0DvE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hT5tkqKZ8wcXiqBlUG1Wj04yRVQ9y84DB8o5/GE8IT388UJUBfpuH5QQ88J1LFhnY
	 FqUB/tWBr9YzqUkW3DM04QU5fuI+v0VncJ2KdA2eAkyfB1rd7niIbaN6wGp9o0F//4
	 AYTaMSyuYIf9crieG7izLIWI4JDsNKNtySu1zdFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25549F80249;
	Fri,  7 Feb 2020 12:24:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA98BF8019B; Fri,  7 Feb 2020 12:24:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33B4FF8012F
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 12:24:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33B4FF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="WrL06LEl"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3d48e00000>; Fri, 07 Feb 2020 03:24:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Feb 2020 03:24:41 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Feb 2020 03:24:41 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Feb
 2020 11:24:36 +0000
To: Dmitry Osipenko <digetx@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-5-git-send-email-spujar@nvidia.com>
 <3a586a6b-5f53-dc44-b9fc-67c633c626ef@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <eccf7df5-bc24-3fe2-e57c-9f3238a6a66d@nvidia.com>
Date: Fri, 7 Feb 2020 16:54:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <3a586a6b-5f53-dc44-b9fc-67c633c626ef@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581074656; bh=zfeC66O1YGW3WlNhQr5Kn916aqKN333KkUzqs+80gNo=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=WrL06LElnSm09IhvXzZuW+itpyYbqV7/N6jBLvpvZBWDHC3yIx1psDaXDS/yeXtyU
 BV+dTv/obC2kRsiEV+KD40yD4dNLtK7DvF0mWTWpCHE3C7YL59WJTxvjK2KzTW1wWT
 G8Z39q3LT3YMVw8c5qoqNThsacWulfqkWqUrUhwbfnxPQ8Uz+oEX1lLqBrC0RdZPZs
 /Z1U1btLksnxtxtYy0asgd1sEN5sepXQz6kH43FUMrSYbzakvBvNaYG88TiIEvWSFo
 O48zzm2B1LmJdXSAifk5iCg37saAtb+3NskX5y6eumfoVBruA41YK8gbhoRQL8uuo6
 vhORN4wM1oGeA==
Cc: jonathanh@nvidia.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, atalambedu@nvidia.com,
 linux-kernel@vger.kernel.org, spujar@nvidia.com, lgirdwood@gmail.com,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, broonie@kernel.org, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

CgpPbiAyLzYvMjAyMCAxMDoyOSBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IEV4dGVybmFs
IGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4KPgo+IDMw
LjAxLjIwMjAgMTM6MzMsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+IC4uLgo+PiArc3RhdGlj
IGNvbnN0IGludCB0ZWdyYTIxMF9jaWZfZm10W10gPSB7Cj4+ICsgICAgIDAsCj4+ICsgICAgIFRF
R1JBX0FDSUZfQklUU18xNiwKPj4gKyAgICAgVEVHUkFfQUNJRl9CSVRTXzMyLAo+PiArfTsKPj4g
Kwo+PiArc3RhdGljIGNvbnN0IGludCB0ZWdyYTIxMF9pMnNfYml0X2ZtdFtdID0gewo+PiArICAg
ICAwLAo+PiArICAgICBJMlNfQklUU18xNiwKPj4gKyAgICAgSTJTX0JJVFNfMzIsCj4+ICt9Owo+
PiArCj4+ICtzdGF0aWMgY29uc3QgaW50IHRlZ3JhMjEwX2kyc19zYW1wbGVfc2l6ZVtdID0gewo+
PiArICAgICAwLAo+PiArICAgICAxNiwKPj4gKyAgICAgMzIsCj4+ICt9Owo+IHN0YXRpYyBjb25z
dCAqdW5zaWduZWQqIGludD8KCndpbGwgZG8uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFs
c2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbHNhLWRldmVsCg==
