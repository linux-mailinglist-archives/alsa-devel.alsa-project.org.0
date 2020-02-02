Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C2E14FD7E
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Feb 2020 15:20:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A50315F2;
	Sun,  2 Feb 2020 15:19:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A50315F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580653215;
	bh=2BLsM8avcZMu+MWFprCKd7UU1zBBtXy1WzOwI/mAI5w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e54fMqFW+AnJsCAkvrErprF0woPqRdZu92XY4x15q59cQJLVn8T4uU44L34R4ff5G
	 vvXYLeQkPgJ7rESKpjYSYbIb+M4aqDWYjj/RUm74C7PNggE1z3FxgDeVpjhQW2uRD6
	 Kjr5krpbn68lUzmwdKJRAkMf/lA7Mjmx8d0CqNns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 468DCF8011D;
	Sun,  2 Feb 2020 15:18:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AE78F80162; Sun,  2 Feb 2020 15:18:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from larkos.de (larkos.de [188.68.52.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1537BF8011D
 for <alsa-devel@alsa-project.org>; Sun,  2 Feb 2020 15:18:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1537BF8011D
Received: from a89-182-228-91.net-htp.de ([89.182.228.91]
 helo=[192.168.178.12])
 by larkos.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <martin@larkos.de>)
 id 1iyG4x-0000wh-99; Sun, 02 Feb 2020 15:18:27 +0100
To: Takashi Iwai <tiwai@suse.de>
References: <20191119084710.29267-5-nmahale@nvidia.com>
 <0b827293-cc8b-3c3e-9160-565037ff172b@larkos.de>
 <s5hmua18jvr.wl-tiwai@suse.de>
From: Martin Regner <martin@larkos.de>
Message-ID: <3a15996e-1b8f-b5f0-77da-2fcfa8334bcb@larkos.de>
Date: Sun, 2 Feb 2020 15:18:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <s5hmua18jvr.wl-tiwai@suse.de>
Content-Language: en-GB
Cc: nmahale@nvidia.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 aplattner@nvidia.com
Subject: Re: [alsa-devel] [PATCH v3 4/4] ALSA: hda - Add DP-MST support for
 NVIDIA codecs
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

SGkgVGFrYXNoaSwKCnRoYW5rcyBmb3IgeW91ciByZXBseS4gSSB0cmllZCB0aGF0IHdpdGgKCmNh
dCAvcHJvYy9hc291bmQvY2FyZDAvY29kZWMjMAoKYnV0IHRoYXQgZG9lc24ndCBoZWxwLiBJJ20g
ZGlnZ2luZyBtZSB0aHJvdWdoIHRoZSBrZXJuZWwgY29uZmlnIHJpZ2h0IApub3cuIE1heSBoYXZl
IHRvIGNoYW5nZSBzb21ldGhpbmcgZWxzZS4KCkkgc2ltcGx5IGNvdWxkIGNyZWF0ZSBhIHBhdGNo
IG9uIG15IGdlbnRvbyBzeXN0ZW0gc3dpdGNoaW5nIGZyb20gCnBhdGNoX252aGRtaSB0byBwYXRj
aF9udmhkbWlfbGVnYWN5IGZvciBldmVyeSBuZXcga2VybmVsLCBidXQgdGhhdCB3b24ndCAKd29y
ayBmb3JldmVyLgoKSWYgeW91IGhhdmUgb3RoZXIgdGhpbmtzIGkgY291bGQgdHJ5IGknZCBhcHBy
ZWNpYXRlIHRvIGhlYXIgdGhlbS4KCmtpbmQgcmVnYXJkcwpNYXJ0aW4KCk9uIDAyLjAyLjIwIDA5
OjM3LCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gT24gU2F0LCAwMSBGZWIgMjAyMCAxNjoyODowOCAr
MDEwMCwKPiBNYXJ0aW4gUmVnbmVyIHdyb3RlOgo+PiBIaSB0aGVyZSwKPj4KPj4gc2luY2UgaSB1
cGRhdGVkIHRvIGtlcm5lbCA1LjUgaSBoYXZlIG5vIHNvdW5kIG92ZXIgaGRtaSBhbnltb3JlIChH
ZUZvcmNlIFJUWAo+PiAyMDcwKS4KPj4KPj4gV2l0aCB0aGUgcHJldmlvdXMga2VybmVsIDUuNC4x
NCBldmVyeXRoaW5nIGlzIGZpbmUuCj4+Cj4+IEFsdGhvdWdoIGkgZ290IHNvdW5kIHdpdGggc3Bl
YWtlci10ZXN0IC1EIGhkbWk6Q0FSRD1OVmlkaWEsREVWPTIgLWMgMiAtcgo+PiA0NDEwMCwgcGF2
dWNvbnRyb2wgc2hvd3MgYWxsIGhkbWkgc291bmQgZGV2aWNlcyBhcyB1bnBsdWdnZWQuCj4+Cj4+
IEkgYmlzZWN0ZWQgaXQgZG93biB0byB0aGlzIGNvbW1pdCAoNTM5OGU5NGZiNzUzZDAyMjMwMTgy
NWViZmE1ZjdjZjhhNjYwZDhlYikKPj4gYW5kIGNoYW5nZWQgdGhlIGxpbmUKPj4KPj4gSERBX0NP
REVDX0VOVFJZKDB4MTBkZTAwOTMsICJHUFUgOTMgSERNSS9EUCIswqAgcGF0Y2hfbnZoZG1pKQo+
Pgo+PiB0bwo+Pgo+PiBIREFfQ09ERUNfRU5UUlkoMHgxMGRlMDA5MywgIkdQVSA5MyBIRE1JL0RQ
IizCoCBwYXRjaF9udmhkbWlfbGVnYWN5KQo+Pgo+PiBOb3cgaXQncyB3b3JraW5nIGFnYWluLiBJ
J20gbm90IHN1cmUgaWYgdGhpcyBpcyBhIHByb2JsZW0gd2l0aCBwdWxzZWF1ZGlvIG9yCj4+IGlm
IHRoZSBSVFggMjA3MCBkb2VzIG5vdCBzdXBwb3J0IHRoZSBtZW50aW9uZWQgY29kZWMuCj4gVGhl
IHJ1bnRpbWUgUE0gdHVybnMgb2ZmIHRoZSBsaW5rLCBzbyB0aGUgaG90cGx1ZyBub3RpZmljYXRp
b24gd29uJ3QKPiBiZSBkZWxpdmVyZWQgYXMgZGVmYXVsdC4gIFBsZWFzZSB0cnkgcmVhZGluZyB0
aGUgY29ycmVzcG9uZGluZyBwcm9jCj4gZmlsZSwgL3Byb2MvYXNvdW5kL2NhcmQqL2NvZGVjKiBm
aWxlLiAgVGhpcyBtYXkgcG93ZXIgdXAgdGhlIGNvZGVjIGFuZAo+IHRyaWdnZXIgdGhlIGhvdHBs
dWcgZGV0ZWN0aW9uIGlmIHRoYXQncyB0aGUgY2F1c2UuCj4KPgo+IFRha2FzaGkKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxp
bmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
