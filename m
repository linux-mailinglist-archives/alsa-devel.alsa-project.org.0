Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D1B9003C
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 12:51:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE60D1664;
	Fri, 16 Aug 2019 12:50:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE60D1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565952667;
	bh=lInfP1MgLgHH3xH5ov1w+ZpQZGeAZB5OKzdTGiUpFLo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F98/RdWr7v7YRapM9OtolRulMSt9GfwK9ypcT+CXhlOnWwc5BI0tWRwTSmRXf7uND
	 0k6wo9FXJClhT0D4K9CnFs7aZUoA3+tQtuMsVEGZliK+i8ImGynOdhET6yduTqbQhq
	 TCn3aE5/LAOjx+Ogibn4cqyrH48f/EhSH4cgx3QQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17D84F80214;
	Fri, 16 Aug 2019 12:49:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00B5CF80214; Fri, 16 Aug 2019 12:49:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 254BBF8011F
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 12:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 254BBF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jdslk7Sd"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7GAnDn6078217;
 Fri, 16 Aug 2019 05:49:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1565952553;
 bh=t/hp6EG4nhKUccuF19DezOI61bKp6V6Fi/tUJ60OwrY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=jdslk7SdZJfHYak+8vZaXEmsyfxYVSnJug4ZRAaANXI1mGCtbhtuw+QeNReMtrYTi
 W8OGTuRpRh97/A9390/Prw9+HZudJH2IRNBvGTUlCK50dUyMRu3pj9Skk3qH8XPls7
 G8SPcINEaFkMD2iq1kYW6vaYgt7h7LbGiqLSw7Bs=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7GAnC52114180
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 16 Aug 2019 05:49:12 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 05:49:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 16 Aug 2019 05:49:11 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7GAn9mK012026;
 Fri, 16 Aug 2019 05:49:09 -0500
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <broonie@kernel.org>, <lgirdwood@gmail.com>
References: <20190813104532.16669-1-peter.ujfalusi@ti.com>
 <1968e008-5311-e624-c997-9433ac624341@linux.intel.com>
 <c040ea94-37c7-3896-3d3b-7baa9f6399fc@ti.com>
 <8558e96c-f78b-56d8-82be-3756617bdfc2@linux.intel.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <78250be1-5f0f-4cc8-3cb1-2d9f30a5a557@ti.com>
Date: Fri, 16 Aug 2019 13:49:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8558e96c-f78b-56d8-82be-3756617bdfc2@linux.intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com
Subject: Re: [alsa-devel] [PATCH] ASoC: core: Move pcm_mutex up to card
 level from snd_soc_pcm_runtime
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CgpPbiAxNS8wOC8yMDE5IDE2LjU2LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4+IEFj
dHVhbGx5IHlvdSAqY2FuKiB0ZXN0IGJ5IHN1Ym1pdHRpbmcgYSBQUiBmb3IgU09GLCBpdCdsbCB0
cmlnZ2VyIHNvbWUKPj4+IHRlc3RzIG9uIEludGVsIHBsYXRmb3JtcyB1c2luZyBEUENNLiBJdCdz
IG5vdCBnb2luZyB0byB0ZXN0IGFueXRoaW5nCj4+PiByZWxhdGVkIHRvIHRoZSBjb21wcmVzc2Vk
IEFQSSBidXQgaXQncyBiZXR0ZXIgdGhhbiBub3RoaW5nLgo+Pgo+PiBHb29kIHRvIGtub3cgYW5k
IHRoYW5rcy4KPj4gSSB3b3VsZCBub3QgdGhvdWdodCBvZiBhYnVzaW5nIHRoZSBTT0YgcHJvamVj
dCB0byBydW4gdGVzdHMsIG5vdCB0aGF0IEkKPj4ga25vdyBob3cgdG8gdHJpZ2dlciB0aGUgcmln
aHQgdGVzdHMgOykKPiAKPiB3ZWxsIHdlIHdpbGwgcnVuIHRob3NlIHRlc3RzIGFueXdheXMgd2hl
biB3ZSBkbyB0aGUgd2Vla2x5IG1lcmdlcywgYW5kCj4gd2hlbiBpbiBkb3VidCBpdCBtaWdodCBi
ZSBtb3JlIHByb2R1Y3RpdmUgZm9yIGFuIEFMU0EgY29udHJpYnV0b3IgdG8gcnVuCj4gdGhlIHRl
c3RzIGFoZWFkIG9mIHRpbWUgdGhhbiByZXBvcnQgdGhhdCB0aGluZ3MgYXJlIGJyb2tlbiBhZnRl
ciB0aGUKPiBtZXJnZSAoYXMgc2VlbiAyIHdlZWtzIGluIGEgcm93IHdpdGggdGhlIG1vZHVsZV9w
dXQgYW5kIGNvbXBpbGF0aW9uIGlzc3VlcykKCkknbGwga2VlcCBpbiBtaW5kLCBkbyB5b3UgaGF2
ZSBzb21lIGRvY3VtZW50YXRpb24gb24gdGhlIHRlc3RzPwoKPj4+IEkgdG9vayB0aGlzIHBhdGNo
IGFuZCBjcmVhdGVkIG9uZSBQUiBhcyBhbiBleGFtcGxlCj4+PiBodHRwczovL2dpdGh1Yi5jb20v
dGhlc29mcHJvamVjdC9saW51eC9wdWxsLzExMzIKPj4KPj4gU2hvdWxkIEkgYmUgd29ycmllZCBi
ZWNhdXNlIG9mIHlvdXIgY29tbWVudCB0aGVyZSBzYXlpbmcgJ0kgaGF2ZSBubyBpZGVhCj4+IHdo
eSB0aGUgQllUX05PQ09ERUMgbW9kZSBmYWlscywgdGhlcmUncyBubyBpbmZvcm1hdGlvbiBwcm92
aWRlZC4nID8KPiAKPiBSZWRvaW5nIHRoZSB0ZXN0cyByZW1vdmVzIHRoYXQgZXJyb3IsIHNvIHRo
aXMgbG9va3MgZmluZS4gTXVzdCBoYXZlIGJlZW4KPiBhIENJIGdsaXRjaAoKSHJtLCBkaWQgaXQg
aGFkIHRoZSBzYW1lIGZhaWx1cmUgdy9vIG15IHBhdGNoPyBSZW9yZGVyaW5nIHRlc3RzIG1pZ2h0
Cmp1c3QgaGlkZSBhIGJ1ZyBzb21ld2hlcmUuLi4KCj4+PiBXaWxsIHNoYXJlIHJlc3VsdHMgd2hl
biBJIGhhdmUgdGhlbS4KPiAKPiBTbyBmYXIgbm8gaXNzdWVzLiBzbyBGV0lXIHNpbmNlIGl0J3Mg
anVzdCAxc3Qgb3JkZXIgYXV0b21hdGljIHRlc3RpbmcKPiAKPiBUZXN0ZWQtYnk6IFBpZXJyZS1M
b3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+CgpUaGFu
ayB5b3UhCi0gUMOpdGVyCgpUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5r
YXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4g
S290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYWxzYS1kZXZlbAo=
