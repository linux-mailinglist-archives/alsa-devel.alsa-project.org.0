Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7144D57248
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 22:08:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C33E0168B;
	Wed, 26 Jun 2019 22:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C33E0168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561579709;
	bh=DYHOQzQyxH4OnUhurLnamey7F2Rhtho9laDBQNC7/Ho=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rasFwWi4H8gjnM+zsfmfJdEeooX018InL5+1CK8K3FrOudm0PCN9TRWeJ5uFqDsiu
	 xG7V1VQ38SUij27pCrKCGgVYf/X9GY3bzNWtXHH2dhtezhRcOkDna5SGnnSWEy6vAX
	 aIFD17lIVMajqJ1VveJIOIDUnqkgpSauJNS1iV24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9DD6F896B7;
	Wed, 26 Jun 2019 22:06:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A32F4F896B9; Wed, 26 Jun 2019 22:06:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp.hora-obscura.de (hora-obscura.de [213.133.109.209])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65128F8071F
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 22:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65128F8071F
Received: from smtp.hora-obscura.de (localhost [127.0.0.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by smtp.hora-obscura.de (Postfix) with ESMTPS id 7EA10AF8081
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 22:06:33 +0200 (CEST)
Received: from ada.local (ipbcc14466.dynamic.kabel-deutschland.de
 [188.193.68.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.hora-obscura.de (Postfix) with ESMTPSA id 3D264AF801E
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 22:06:33 +0200 (CEST)
To: alsa-devel@alsa-project.org
References: <65ad9ddb-bb67-2dc0-d5f5-e0c518641db2@hora-obscura.de>
 <s5hwohat80v.wl-tiwai@suse.de>
From: Stefan Sauer <ensonic@hora-obscura.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ensonic@hora-obscura.de; prefer-encrypt=mutual; keydata=
 mQGiBDiW1zARBADnMiXRu0ZRcbWAw4NefyeZej5pRX/mzBAvplIhAeJ5vA0zfzd3aIyAxYv1
 iA+/p7QwGVAMZ9Gio8ZLvgfDYjrHbez7Bc4TWuTck6hmQAIBI7ptyWhOrePMiQ8b4yN8KP7I
 PoJHBpC0jLbuwmwC+/2yQPT4V9AQ+Unqe8xvuBJczwCgnAo6JpYIZDpy/vt4soFG3o38OrME
 AOPzt7SdyuzVp9w3mO/2XCzyJcn1fpUGlChbljayKvrDvPJEZtm5d65zBV6iYSSpF8GtdX1q
 znSF5siMSvF7DljZT4oIDqYTJAEZXDYYM7aYyTXeZ1hk9YoiRaMiT84AvQRvQVwYUqlygNMO
 q14zkcdhSpk5i1HDum+i1/T/RSFDBACcpdlqjvg4AoMbyf9UNr/tmfcITEKkLkYtPzmF4DIK
 Tqbq+FgqB5ltPPgTffJ6yWfTQAt1dr+XZeivdgyCX3bo6784rtOc7/ICjBdOktKj6zb88tPp
 kYw16Fr5OcNollJxm+/pY+JXwAl5IsbN3ysoBuBOBbu+pAC1Py39D/+af7QvU3RlZmFuIEtv
 c3QgKGVuc29uaWMpIDxlbnNvbmljQGhvcmEtb2JzY3VyYS5kZT6IXwQTEQIAHwIbAwQLBwMC
 AxUCAwMWAgECHgECF4ACGQEFAkKMY0QACgkQITDA+qr9gcydpwCfbGuNpfw+hge7Xcp9FerJ
 35fMMY0An0vvOJG3ORIUHE1VvfoC0ITb6heFuQENBDiW11IQBACUp8q45lLmzHujYh7w8fd4
 cjkb57oScfcD+lliCOmKHZOxRa8Ew3ULtgSze1JPnDT6a5jgnxMKPIHjqlTCpEyTxcMHOi3L
 8BBft2YzdB3cLnrMXx1mPU//vkT93VOnXTFjxKbMEK8OHSh+JpzgySjmXfwVfn/EiyXkroEV
 Lip92wADBQP/ej1uwM//zfKumDRJskyMCOfSAUfwRZhHkLWPvBQfPgUqdU7NcYACItAFVbIK
 tSES1Vd3L0kbBtnygCf4SwGMRARUALipof4DxVMxaK46igLGC+UkiTz8swUV/81+EUfKEqdd
 QjRv6Gp7VZSDkv4sBcjIMydr8o2Mc8P/ByKvUPWIRgQYEQIABgUCOJbXUgAKCRAhMMD6qv2B
 zLilAJ4jS2hqfeEbZxvmr1+0FxBx2/x9CQCaA5vugvJQg8PXRT7ScAnoGgCf994=
Message-ID: <0f7f9e91-2c7e-d292-8ca1-a74b52607aea@hora-obscura.de>
Date: Wed, 26 Jun 2019 22:06:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <s5hwohat80v.wl-tiwai@suse.de>
Content-Language: en-US
Subject: Re: [alsa-devel] focusrite scarlett 18i20 : Mixer controls with
 corrupted names for
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

QW0gMjUuMDYuMTkgdW0gMDk6NTQgc2NocmllYiBUYWthc2hpIEl3YWk6Cj4gT24gU2F0LCAyMiBK
dW4gMjAxOSAyMjo1NToyNSArMDIwMCwKPiBTdGVmYW4gU2F1ZXIgd3JvdGU6Cj4+Cj4+IFNvIHRo
ZSBmaXJzdCA4IGNvbnRyb2xzIGFyZSBhZGRlZCBzb21ld2hlcmUgZWxzZS4gTG9va3MgbGlrZSB0
aGlzIGlzIGZyb20KPj4gbWl4ZXIuYyBhbmQgYWZ0ZXIKPj4gZWNobyAtbiAnZmlsZSBzb3VuZC91
c2IvbWl4ZXIuYyArcCcgPi9zeXMva2VybmVsL2RlYnVnL2R5bmFtaWNfZGVidWcvY29udHJvbAo+
PiBJIGdldAo+PiBbIDQ0MDUuODU1NDMyXSB1c2IgMS0yOiBbNTFdIFBVIFtLS0tLS0tLS0tLS0tL
w4PDg8ODw4PDg8ODw4PDg8ODw4PDgyBTd2l0Y2hdIGNoID0gMSwgdmFsID0gMC8xCj4+IFsgNDQw
NS44NTY0MjNdIHVzYiAxLTI6IFs1Ml0gUFUgWyBTd2l0Y2hdIGNoID0gMSwgdmFsID0gMC8xCj4g
Cj4gVGhpcyBpbmRpY2F0ZXMgdGhhdCB0aGVzZSB3ZWlyZCBuYW1lcyBjb21lIGZyb20gdGhlIHR3
byBleHRlbnNpb24KPiB1bml0cyBpZCA1MSBhbmQgNTIuCj4gQ291bGQgeW91IHB1dCBzb21lIGRl
YnVnIHByaW50IGluIGJ1aWxkX2F1ZGlvX3Byb2N1bml0KCkgbGlrZSBiZWxvdz8KCkkgdHJhY2Vk
IGl0IGRvd24gdG8gdGhpcyBwYXJ0IGZyb20gc291bmQvdXNiL21peGVyLmM6Cm5hbWVpZCA9IHVh
Y19wcm9jZXNzaW5nX3VuaXRfaVByb2Nlc3NpbmcoZGVzYywgc3RhdGUtPm1peGVyLT5wcm90b2Nv
bCk7CnVzYl9hdWRpb19kYmcoc3RhdGUtPmNoaXAsICJkZXNjLT5iVW5pdElEPSVkLCBwcm90bz0l
ZCwgbmFtZWlkPSVkXG4iLAogCSAgICAgIGRlc2MtPmJVbml0SUQsIHN0YXRlLT5taXhlci0+cHJv
dG9jb2wsIG5hbWVpZCk7CmxlbiA9IDA7CmlmIChuYW1laWQpIHsKCWxlbiA9IHNuZF91c2JfY29w
eV9zdHJpbmdfZGVzYyhzdGF0ZS0+Y2hpcCwKCQkJCSAgICAgICBuYW1laWQsCgkJCQkgICAgICAg
a2N0bC0+aWQubmFtZSwKCQkJCSAgICAgICBzaXplb2Yoa2N0bC0+aWQubmFtZSkpOwoJdXNiX2F1
ZGlvX2RiZyhzdGF0ZS0+Y2hpcCwgIm5hbWVpZD0lZCwgbGVuPSVkLCBmYWxsYmFjayBuYW1lPScl
cydcbiIsCiAJCSAgICAgIG5hbWVpZCwgbGVuLCBuYW1lKTsKfQoKWyA2MjQxLjA0NTczNF0gdXNi
IDEtMjogZGVzYy0+YlVuaXRJRD01MSwgcHJvdG89MzIsIG5hbWVpZD05MApbIDYyNDEuMDQ1ODYx
XSB1c2IgMS0yOiBuYW1laWQ9OTAsIGxlbj0zNSwgZmFsbGJhY2sgbmFtZT0nRXh0ZW5zaW9uIFVu
aXQnClsgNjI0MS4wNDU4NjhdIHVzYiAxLTI6IFs1MV0gUFUgW0tLS0tLS0tLS0tLS0vDg8ODw4PD
g8ODw4PDg8ODw4PDg8ODIFN3aXRjaF0gY2ggPSAxLCB2YWwgPSAwLzEKWyA2MjQxLjA0Njc0NV0g
dXNiIDEtMjogZGVzYy0+YlVuaXRJRD01MiwgcHJvdG89MzIsIG5hbWVpZD04MgpbIDYyNDEuMDQ2
ODU3XSB1c2IgMS0yOiBuYW1laWQ9ODIsIGxlbj0xLCBmYWxsYmFjayBuYW1lPSdFeHRlbnNpb24g
VW5pdCcKWyA2MjQxLjA0Njg2Ml0gdXNiIDEtMjogWzUyXSBQVSBbIFN3aXRjaF0gY2ggPSAxLCB2
YWwgPSAwLzEKClRoZSBkZXZpY2UgaXMgdXNpbmcgVUFDX1ZFUlNJT05fMi4gVGhlIGNvZGUgaW4g
aW5jbHVkZS91YXBpL2xpbnV4L3VzYi9hdWRpby5oIGlzCmEgYml0IGhhcmQgdG8gcmVhZCBzaW5j
ZSB1YWNfbWl4ZXJfdW5pdF9kZXNjcmlwdG9yIGhhcyBhIHZhcmlhYmxlIGxlbmd0aCBhbmQgdGhl
CmNvZGUgaXMgYWRkaW5nIHNldmVyYWwgb2Zmc2V0LCBJJ2xsIG5lZWQgdG8gYWRkIG1vcmUgcHJp
bnRmcyB0aGVyZSB0byBjaGVjayBpZgppdCBpcyBjb3JyZWN0LiBJIGFtIGNvbnN1bHRpbmcKaHR0
cHM6Ly93d3cudXNiLm9yZy9zaXRlcy9kZWZhdWx0L2ZpbGVzL2F1ZGlvMTAucGRmIGJ1dCBJIGFt
IG5vdCBzdXJlIGlmIHRoaXMKY292ZXJzIFVBQzIuCgpTdGVmYW4KCj4gCj4gCj4gdGhhbmtzLAo+
IAo+IFRha2FzaGkKPiAKPiAtLS0gYS9zb3VuZC91c2IvbWl4ZXIuYwo+ICsrKyBiL3NvdW5kL3Vz
Yi9taXhlci5jCj4gQEAgLTIzNTgsOCArMjM1OCwxMCBAQCBzdGF0aWMgaW50IGJ1aWxkX2F1ZGlv
X3Byb2N1bml0KHN0cnVjdCBtaXhlcl9idWlsZCAqc3RhdGUsIGludCB1bml0aWQsCj4gIAlmb3Ig
KGluZm8gPSBsaXN0OyBpbmZvICYmIGluZm8tPnR5cGU7IGluZm8rKykKPiAgCQlpZiAoaW5mby0+
dHlwZSA9PSB0eXBlKQo+ICAJCQlicmVhazsKPiAtCWlmICghaW5mbyB8fCAhaW5mby0+dHlwZSkK
PiArCWlmICghaW5mbyB8fCAhaW5mby0+dHlwZSkgewo+ICsJCXByX2luZm8oIlhYWCB1bml0ICVk
IHRvIGRlZmF1bHRfaW5mb1xuIiwgdW5pdGlkKTsKPiAgCQlpbmZvID0gJmRlZmF1bHRfaW5mbzsK
PiArCX0KPiAgCj4gIAlmb3IgKHZhbGluZm8gPSBpbmZvLT52YWx1ZXM7IHZhbGluZm8tPmNvbnRy
b2w7IHZhbGluZm8rKykgewo+ICAJCV9fdTggKmNvbnRyb2xzID0gdWFjX3Byb2Nlc3NpbmdfdW5p
dF9ibUNvbnRyb2xzKGRlc2MsIHN0YXRlLT5taXhlci0+cHJvdG9jb2wpOwo+IEBAIC0yMzc1LDgg
KzIzNzcsMTEgQEAgc3RhdGljIGludCBidWlsZF9hdWRpb19wcm9jdW5pdChzdHJ1Y3QgbWl4ZXJf
YnVpbGQgKnN0YXRlLCBpbnQgdW5pdGlkLAo+ICAJCX0KPiAgCj4gIAkJbWFwID0gZmluZF9tYXAo
c3RhdGUtPm1hcCwgdW5pdGlkLCB2YWxpbmZvLT5jb250cm9sKTsKPiArCQlpZiAobWFwKQo+ICsJ
CQlwcl9pbmZvKCJYWFggbWFwIGZvdW5kIGZvciB1bml0ICVkXG4iLCB1bml0aWQpOwo+ICAJCWlm
IChjaGVja19pZ25vcmVkX2N0bChtYXApKQo+ICAJCQljb250aW51ZTsKPiArCj4gIAkJY3ZhbCA9
IGt6YWxsb2Moc2l6ZW9mKCpjdmFsKSwgR0ZQX0tFUk5FTCk7Cj4gIAkJaWYgKCFjdmFsKQo+ICAJ
CQlyZXR1cm4gLUVOT01FTTsKPiBAQCAtMjQ0NCwxOSArMjQ0OSwyNiBAQCBzdGF0aWMgaW50IGJ1
aWxkX2F1ZGlvX3Byb2N1bml0KHN0cnVjdCBtaXhlcl9idWlsZCAqc3RhdGUsIGludCB1bml0aWQs
Cj4gIAkJa2N0bC0+cHJpdmF0ZV9mcmVlID0gc25kX3VzYl9taXhlcl9lbGVtX2ZyZWU7Cj4gIAo+
ICAJCWlmIChjaGVja19tYXBwZWRfbmFtZShtYXAsIGtjdGwtPmlkLm5hbWUsIHNpemVvZihrY3Rs
LT5pZC5uYW1lKSkpIHsKPiArCQkJcHJfaW5mbygiWFhYIG5hbWUgY29waWVkIGZyb20gbWFwOiAn
JXMnIGZvciB1bml0ICVkXG4iLCBrY3RsLT5pZC5uYW1lLCB1bml0aWQpOwo+ICAJCQkvKiBub3Ro
aW5nICovIDsKPiAgCQl9IGVsc2UgaWYgKGluZm8tPm5hbWUpIHsKPiAgCQkJc3RybGNweShrY3Rs
LT5pZC5uYW1lLCBpbmZvLT5uYW1lLCBzaXplb2Yoa2N0bC0+aWQubmFtZSkpOwo+ICsJCQlwcl9p
bmZvKCJYWFggbmFtZSBjb3BpZWQgZnJvbSBpbmZvOiAnJXMnIGZvciB1bml0ICVkXG4iLCBrY3Rs
LT5pZC5uYW1lLCB1bml0aWQpOwo+ICAJCX0gZWxzZSB7Cj4gIAkJCW5hbWVpZCA9IHVhY19wcm9j
ZXNzaW5nX3VuaXRfaVByb2Nlc3NpbmcoZGVzYywgc3RhdGUtPm1peGVyLT5wcm90b2NvbCk7Cj4g
KwkJCXByX2luZm8oIlhYWCBuYW1laWQ9JWQsIHVuaXQgJWRcbiIsIG5hbWVpZCwgdW5pdGlkKTsK
PiAgCQkJbGVuID0gMDsKPiAtCQkJaWYgKG5hbWVpZCkKPiArCQkJaWYgKG5hbWVpZCkgewo+ICAJ
CQkJbGVuID0gc25kX3VzYl9jb3B5X3N0cmluZ19kZXNjKHN0YXRlLT5jaGlwLAo+ICAJCQkJCQkJ
ICAgICAgIG5hbWVpZCwKPiAgCQkJCQkJCSAgICAgICBrY3RsLT5pZC5uYW1lLAo+ICAJCQkJCQkJ
ICAgICAgIHNpemVvZihrY3RsLT5pZC5uYW1lKSk7Cj4gLQkJCWlmICghbGVuKQo+ICsJCQkJcHJf
aW5mbygiWFhYIGNvcHkgc3RyaW5nIGRlc2MgJyVzJ1xuIiwga2N0bC0+aWQubmFtZSk7Cj4gKwkJ
CX0KPiArCQkJaWYgKCFsZW4pIHsKPiAgCQkJCXN0cmxjcHkoa2N0bC0+aWQubmFtZSwgbmFtZSwg
c2l6ZW9mKGtjdGwtPmlkLm5hbWUpKTsKPiArCQkJCXByX2luZm8oIlhYWCBjb3B5IGRlZmF1bHQg
bmFtZSAnJXMnXG4iLCBrY3RsLT5pZC5uYW1lKTsKPiArCQkJfQo+ICAJCX0KPiAgCQlhcHBlbmRf
Y3RsX25hbWUoa2N0bCwgIiAiKTsKPiAgCQlhcHBlbmRfY3RsX25hbWUoa2N0bCwgdmFsaW5mby0+
c3VmZml4KTsKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IEFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Cj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNh
LWRldmVsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
