Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAA37A7923
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 12:26:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4C17DEB;
	Wed, 20 Sep 2023 12:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4C17DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695205570;
	bh=LEqP3to5kSUXIEEmF3hYJ+S30P+OVmIUNYqyWTgGVvw=;
	h=Date:Subject:References:To:Cc:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jPFxBUYo2YKa95rWWe5xjQun1TBXPIaKDMKmI44av+T0yW4MCnGe/lDYhGNxBrpMD
	 PyFGe+1u0FG2PGN35nne7JSGDaNP4JGkMN1q/VhhZCfyXNeXgAd9lkMTFZA3KCbfBd
	 b3gc7hl36ks1G+UWF/5qISrYak0ok8b0GOoU/5Lk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4048BF80125; Wed, 20 Sep 2023 12:25:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8341F80125;
	Wed, 20 Sep 2023 12:25:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76F2CF801F5; Wed, 20 Sep 2023 12:25:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.0 required=5.0 tests=HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from asave01.hostfactory.ch (asave01.hostfactory.ch [185.117.170.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 815D9F800F4
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 12:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 815D9F800F4
Received: from server11.hostfactory.ch ([185.117.169.60])
	by asave01.hostfactory.ch with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <michele.perrone@weiss.ch>)
	id 1qiuOL-00F3kM-J2; Wed, 20 Sep 2023 12:25:11 +0200
Received: from [192.168.0.85]
 (156.14.3.213.static.wline.lns.sme.cust.swisscom.ch [213.3.14.156])
	(Authenticated sender: michele.perrone@weiss.ch)
	by server11.hostfactory.ch (Postfix) with ESMTPSA id ECAA74011A3D3;
	Wed, 20 Sep 2023 12:25:07 +0200 (CEST)
Message-ID: <2644a27e-aa51-4d11-9890-988c02f9631e@weiss.ch>
Date: Wed, 20 Sep 2023 12:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: Re: MAN301 external clock issues (Re: [PATCH] ALSA: dice: add
 stream format parameters for Weiss devices)
Content-Language: en-US
References: <99c82e03-7323-4d4d-8ced-7fd773138f6e@weiss.ch>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Takashi Iwai <tiwai@suse.de>, Rolf Anderegg <rolf.anderegg@weiss.ch>,
 alsa-devel@alsa-project.org
From: Michele Perrone <michele.perrone@weiss.ch>
In-Reply-To: <99c82e03-7323-4d4d-8ced-7fd773138f6e@weiss.ch>
X-Forwarded-Message-Id: <99c82e03-7323-4d4d-8ced-7fd773138f6e@weiss.ch>
X-PPP-Message-ID: 
 <169520550829.31684.1007482696909072213@server11.hostfactory.ch>
X-PPP-Vhost: weiss.ch
X-Originating-IP: 185.117.169.60
X-SpamExperts-Domain: outboundprotection.hostfactory.ch
X-SpamExperts-Username: 185.117.169.60
Authentication-Results: hostfactory.ch;
 auth=pass smtp.auth=185.117.169.60@outboundprotection.hostfactory.ch
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.12)
X-Recommended-Action: accept
X-Filter-ID: 
 Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT80WC5yg1ftl76rGYe6+xgzPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5ynOqv5wVH0VS/etXvrFNNzaJlM0GUlwLkcZrRacppWhTh3
 wKoTBNAKgp9qBcKLgDljPyzCxIJm7qFlTroi9VKv/7Rl0Dd5eFQ0eM8i42SsSUGlz8CJSOMrvzx9
 TVg3RkVD616lhcpgfhVi/IENG2PRp8jZ4AoGBlDR94YkH0RjFcsS2wyX4wFvfD5xwAerAR9lOVrL
 YTpDlVt2LhrK2BfEQs6EgGedxeuvfrMrARjFPGdDtN/2cBsaR8p7RVNO0vXk/agSvtgte2zCXW1J
 lwXnVmkAHwHuPWE1+MMVWSY/DErqhy+tapdwJ8uKml1tG0Pt3JsC5e/DlYVV9jqBtc/t9a3fvBg8
 I7q5hFKojyxxcVkDWpg3cUqnTXK7+jR2jt1xuwt6BW/LqWzUw+fkjzpuRAwX31WVY5lWjWxuGSRu
 xdeJD5/Wl4aBF+CY0mxh2pSR7yU2QIWCTCd5A9CNaN6pRWtLR0Mn2ASypXTCTfApisVZPVE5xgLw
 XEbnvqUcIYd16SviU/hmLrTy1VycMwgpTs2BZNjhN1NaK5LAGwujj33UzKaibcXCMztdU5OxbHAz
 rxMg36Jn7L4UIiMZgOGil2hsR99u5gXb6tWyU4Ig+a0jiD6XqsJZtjQxlyCdsez2hboJ1sHD93yk
 U2WEJHrlCtbEguydx7+/OTtKDkewxfJ6DcjLH9PvBV/k1+oUINF8n6keo/2ef0bGZ0Uisg8CbZVN
 4NTBUrEDj1SPmTBxtOQ7idC564HPQBiw1dCeYtfXE+I53wZSkstgjzhKtDrtgcxVxWy4b2kTdalQ
 jRLp2SyiUF2AJZ1QrWKEE58+XwcKUCZ0tsh7gYLXbSqSm9WZx1ILoEx8qz9oR4D+d8dkH+C1LXbN
 jyFcag1clVEejgbdjKzPlwftnaBy0ehO99jiTPI3niUsrRv1n/PK9pAbm6Tr3pQZv6RcTO7z7Tdv
 sMgnJXsrAoZkwMikWJbAJWw03jR5NeVaJQBh0uawl0Cg8sRZ+ATCUj4u0XmPDtAfhCkr94ZlIK28
 jWwYXvNEsJFM21XLIJAOtNbl33sd4Q7NgbK8077bKr8r1UF38Pkt1hgrBnzcyz4YpNRToixck2YU
 MS+4ayUpOtEhdxekWDmK9g==
X-Report-Abuse-To: spam@asave01.hostfactory.ch
Message-ID-Hash: YFXKKXO2YCGAD5QKMD2ZAMYFJ5AOGZQT
X-Message-ID-Hash: YFXKKXO2YCGAD5QKMD2ZAMYFJ5AOGZQT
X-MailFrom: michele.perrone@weiss.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YFXKKXO2YCGAD5QKMD2ZAMYFJ5AOGZQT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgVGFrYXNoaSwNCg0KT24gMTkvMDkvMjMgMTY6MDksIFRha2FzaGkgU2FrYW1vdG8gd3JvdGU6
DQo+IEZvciB0aGUgY2FzZSBvZiBleHRlcm5hbCBzb3VyY2Ugb2YgY2xvY2ssIHlvdSBuZWVkIHRv
IGNvbmZpZ3VyZSB0aGUNCj4gc2FtcGxpbmcgcmF0ZSBpbiBkZXZpY2UgYnkgeW91ciBoYW5kLCBi
eSBhY2Nlc2luZyB0byBHTE9CQUxfQ0xPQ0tfU0VMRUNUDQo+IG9mZnNldCBpbiBnbG9iYWwgc2Vj
dGlvbiBvZiBUQ0FUIHByb3RvY29sLg0KSSdtIGFibGUgdG8gZG8gdGhpcyBmcm9tIHRoZSBrZXJu
ZWwgc3BhY2UsIGJ1dCBJIHdvdWxkbid0IGtub3cgaG93IHRvDQphY2hpZXZlIHRoaXMgaW4gdGhl
IHVzZXItc3BhY2Ugd2l0aG91dCBzd2l0Y2hpbmcgYmFjayBhbmQgZm9ydGggYmV0d2Vlbg0KaW50
ZXJuYWwgYW5kIGV4dGVybmFsIGNsb2NrIHNvdXJjZS4NCg0KTW9yZW92ZXIsIHRoZXJlIHNlZW1z
IHRvIGJlIG5vICd3cml0ZScgaGFuZGxlciBpbnN0YWxsZWQgaW5zaWRlDQonc25kX2RpY2VfY3Jl
YXRlX2h3ZGVwKCknWzJdLCBzbyB1c2luZyAnc25kX2h3ZGVwX3dyaXRlKCknIGZyb20NCnVzZXIt
c3BhY2UgQUxTQSBpcyBub3QgcG9zc2libGUuDQoNClRoZSBvbmx5IG9wdGlvbiBJIHNlZSBpcyBh
ZGRpbmcgYSBuZXcgY29udHJvbCB0bw0KJ3NuZF9rY29udHJvbF9uZXcgY29udHJvbHNbXSdbM10s
IGluc2lkZSAnZGljZV9zbmRfY3RsX2NvbnN0cnVjdCgpJ1szXQ0KaW4gb3VyIEFWL0MgY29kZS4N
Cg0KQnV0IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyB0aGUgYmVzdCBzb2x1dGlvbiwgaW4gdmlldyBv
ZiB0aGUgZmFjdCB0aGUgd2UNCndpbGwgYmUgc3dpdGNoaW5nIHRvIHNuZC1maXJld2lyZS1jdGwt
c2VydmljZXNbNF0gaW4gdGhlIG5lYXIgZnV0dXJlLg0KPiBJIHByb2dyYW1tZWQgQUxTQSBkaWNl
IGRyaXZlciB0byBiZWhhdmUgbGlrZSB0aGF0Lg0KPg0KPiBUaGUgZHJpdmVyIGNvbmZpZ3VyZXMg
dGhlIHRhcmdldCBkZXZpY2UgZm9yIHNhbXBsaW5nIHJhdGUgd2hpY2ggQUxTQSBQQ00NCj4gYXBw
bGljYXRpb24gZXhwZWN0cyB3aGVuIHRoZSBkZXZpY2UgdXNlcyBpbnRlcm5hbCBzb3VyY2Ugb2Yg
Y2xvY2suIFdoZW4NCj4gdGhlIGRldmljZSBpcyBjb25maWd1cmVkIHRvIHVzZSBleHRlcm5hbCBz
b3VyY2Ugb2YgY2xvY2ssIHRoZSBkcml2ZXINCj4gYWRkcyBjb25zdHJhaW5zIHRvIEFMU0EgUENN
IGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24gc28gdGhhdCB0aGUgYXBwbGljYXRpb24NCj4gd29ya3Mg
d2l0aCBjdXJyZW50IHNhbXBsaW5nIHJhdGUgY29uZmlndXJlZCBpbiBkZXZpY2UuDQpUaGFua3Mg
Zm9yIGV4cGxhaW5pbmcgdGhpcy4gSSBoYXZlIG5vdyBmb3VuZCB0aGUgcGxhY2UgaW4gdGhlIGNv
ZGUgd2hlcmUNCnlvdSBkbyB0aGlzWzFdLg0KDQpNYXkgSSBhc2ssIHdoYXQgaXMgdGhlIHJlYXNv
biBmb3IgdGhpcyBsaW1pdGF0aW9uPyBJIGRvbid0IHNlZSBhbnkNCnJlbGV2YW50IGNvbm5lY3Rp
b24gYmV0d2VlbiB0aGF0IGxhc3QgdXNlZCBpbnRlcm5hbCBzYW1wbGluZyByYXRlLCBhbmQNCnRo
ZSBjdXJyZW50IGV4dGVybmFsIHNhbXBsaW5nIHJhdGUuDQoNCk1vcmVvdmVyLCB0aGUgRElDRSBk
cml2ZXIgaXMgYWJsZSB0byBzZWUgdGhlIGV4dGVybmFsIHNhbXBsaW5nIHJhdGUgaW4NCnJlYWwt
dGltZS4gU28gd2hlbiB0aGUgZXh0ZXJuYWwgY2xvY2sgcmF0ZSBpcyBzZWxlY3RlZCBhbmQgbG9j
a2VkLA0Kd291bGRuJ3QgaXQgbWFrZSBzZW5zZSB0aGF0IHRoZSBkZXZpY2UgcmF0ZSBmb2xsb3dl
ZCB0aGUgZXh0ZXJuYWwgcmF0ZQ0KYXV0b21hdGljYWxseSwgd2l0aG91dCB1c2VyLXNwYWNlIGlu
dGVydmVudGlvbj8NCj4gUmVnYXJkcw0KPg0KPiBUYWthc2hpIFNha2Ftb3RvDQpLaW5kIHJlZ2Fy
ZHMsDQpNaWNoZWxlIFBlcnJvbmUNCg0KWzFdaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xp
bnV4L2Jsb2IvdjYuNi1yYzIvc291bmQvZmlyZXdpcmUvZGljZS9kaWNlLXBjbS5jI0wyMDENClsy
XWh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL3Y2LjYtcmMyL3NvdW5kL2Zp
cmV3aXJlL2RpY2UvZGljZS1od2RlcC5jI0wxNjcNClszXWh0dHBzOi8vZ2l0aHViLmNvbS93ZWlz
cy1lbmdpbmVlcmluZy9zbmQtZGljZS9ibG9iLzVhOTU0OTZjMDY2NjA0OGJjNWJjOGMwN2IzZTFk
NzRmMzkyZGM5YTQvZGljZS1hdmMuYyNMNjYxDQpbNF1odHRwczovL2dpdGh1Yi5jb20vYWxzYS1w
cm9qZWN0L3NuZC1maXJld2lyZS1jdGwtc2VydmljZXMNCg==
