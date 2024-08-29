Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0C3965930
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 09:56:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9919B84D;
	Fri, 30 Aug 2024 09:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9919B84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725004589;
	bh=FZI/81xsT6oSUniOn0ozbIuNZaK92dZMEsCAK5tlszQ=;
	h=Date:From:To:Subject:References:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Biz4riMUbFt6BdtwlrxxLUUWR7jkfOfoKeSfMg0uY6ep4fOp4fk0xFqEcRtxPwfH6
	 mjZnWtWds9whWyL5somsunL+s+H3WYCo3nAPmAkU03bDi9tmzUEbaUHkXbvp+4Kr1o
	 qWsqsXg8eL326++M03R+ZqIG7odg5/mWq1jIE9lk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EE17F805B3; Fri, 30 Aug 2024 09:55:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15E58F805B1;
	Fri, 30 Aug 2024 09:55:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2FB4F80528; Thu, 29 Aug 2024 03:19:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sonic315-21.consmr.mail.ne1.yahoo.com
 (sonic315-21.consmr.mail.ne1.yahoo.com [66.163.190.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E613F80494
	for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2024 03:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E613F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=qgQRYOgt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1724894375; bh=g6w9JsN4K6iRP65xpmMIOAEep37b1Heg+1RFlprI20g=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=qgQRYOgtObPUWNjno/5d/Bb8riWXElkvLuJryULZiNfNXhJ1Spirkp6vzgBdBZkx419m7KU9qXVYyJwx4nFrX36R5tKNDcQFpOR5jO6HsKh//avC6Qk4jxI5K1kLgXT1gm68arvYmRgWdQSttBT+Odt7cp801M2WCiDVwmu7o1HJaK6KGagvE+CmcTQCEeu+oQeW4Mwnlf3+gxfUVc4lVMV3FmQj2F2bb+qfCDqIi7F6KHzsB9qIdrjAWbIMWk5HOa6j8s3iuswHKP1NASTVesYIbOhgm4HEds8jJ14CycSa8SVENl0XK9pR3IRvSjmGY0yJsYfAZk4pzhz9seEPeA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1724894375; bh=/JHIV935CbwrEGEliGiNfgFry74izqldXPEOI2j35f/=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=V0lyBIuIzNZD48b8xO1GCzNTkSooOuAMVAb2m9fKxoz1DNUWpDGHBjxdDaq73GA4xK6ihWKpW8nIZdliXBGacdsTaqQ0mVpt5wdfRtWcGNQe+o/SHQepNGyQFGPJBqF5KvawRwRpH05MvM22U0bfGvs6wJ2PEtdbjAfL7HZ1b7eycF8AhAA16eEdXvKFbUDZnO/i6kjCIf0c7dGdgTHeoegSoBucX9XIfWSSxY53iKkrMFNLIJEaJvqtFn3fukTAandPpZw9AHGbKe78jtBjE0bEdMJwu/KC9vTd88ONkTokAFxM6eKRphdcuxlKukYrlbSLOsXMDftaDnCtFMQleQ==
X-YMail-OSG: fzL0BbIVM1n6LKuPuWDwDiOwBZWnQ9pIfpE9m3Pam8IWsNFtbjpPR4WOv1nUwr2
 jlqqgDClhNuRt_EvWM6tFZCGWtgmd6ecIiD1rSfZ6YJDdvm8YDjGlvf.zCKJXSxS26dZV.IY2qob
 oN7ZneEwwK0OklXas6SzBHzr.g2JyEzP8.qmOj_LvyHS6c5dcirBbpNfbIfYlIzmELCldGc9PXhQ
 cBHTLmofJkZkx2LtBi1hG8MUiV1LazdaybNRoRo0NWI9ue31nXh5dJmXBEUXifz98uvebqPtPdjE
 aHfdwNbAFh62.64pcyL52BraUOP6dGBfg7p0BOClJG0hjNZyvIZTNp7_GZqiqT9krfs_bwdmxQ41
 BdCbnWrzo14jJh_U7s8PZ4a1CjlIyFiqjpSa1o7F4AS7zROGlgbUyqs79ChCAUfecccAGgA3ASQB
 5XnM3zlCB90UKCMdCNOELVOztl4cb3ZfTszGbvvxuiozxmLLMEj0DIVDOupLZR44ZFSCLgw0tDC5
 ocV3CHKHj9u4yn1NZmhsRr52oDRaKOpJvkUDq803FotJ3r_bQ1gFFOPapTiSZ93o53q1GEEBrebP
 NY_4ku6JPqinc40vXKz_iQtF984ZYIpejEaIJFokgxnerEx4Pzuvs4CJBONlohG_7tktSmtbiHgS
 h1E_dqOzuEgZAWHd.DqK.4XnndFi_VsCIDSBrk4yK5iz7gH_sd9K092qTJLmcFWpKAib9O1mW4QK
 dzF36JmfMh0_LrPxaktBYZOmcHSnI3m2niG9DTSeBFfX19kRWmgdXBtiZPn0EhKTXg_I0HuuUt0w
 pR_GkhEvz0luVjcHY4YGan2eESV8sF3f8rih3L2TXxUXHyBJD3DzPFVtGR8mSkYhavo9wrBniOqu
 XHpU9KLtntN1AXrCC9_iWEw_9UkZ7xr6nm8KDGRHZkKfaq9COQOA6j7VJZwvC4Y_6VSBc6bhWVCv
 ZiExHgRD339MBHZjzQ4d_pdoeYLzPYrFyPgLv6m4uFa6UlJxT96ZBTfP6OReoaXluwP8jUedSEuO
 ljyxPq42NaIlCfSIx0xcJBGvItYNkmLh5fgybGDT9SktzgRYA2rdf9O2QhzeYZtKXD79wTVIV.w_
 TaYuXVMOn4BMn.yP3ouk7NOGGQTGDD6dvOslr0WZSt6CpY_zVpu7c7wSCkh61CoRL6d1WGzYdgm6
 NJcYZvwaOp5vTKqfBVG4ApueMfrpL.H4dlxynjNB7Fnw61isFJSuI.2dAqwmcKMWhpcUl7tJ57Qf
 II7Fr_7biD_dlQHTP.G96rdSwb5Lh1L40hSgK3mUDcqSJlVwKttKkMginGMeVnT2hrfkh.YGO.ss
 f4DX2dhzEMbb4PEGfilr4iyXezlz6L7d_cztiIX5WB7QxSvC8TeWxkNMcwlsfhj8TA.c7X2.wYk9
 D4xmS2WuDDKzrohnPAujZLDvXNjxjotmmnkjJKprADMGnxh3.4ol5cvslf9BcbakP5JhskVDAs1.
 OXS4qALzZy1XpJM4AaHxTdtKjxBcAYiq0kHGr41EOD5o0UmZP9jGm_gtyD2GJGIGU0WfrSWP2G1Y
 n2Cy1_26skMDSCX4Vyhjtxt7fikO5FqT0Qk_S8sxRno8bOQRUK5w7pryBafh4TjilNFv4WtTjqvm
 3UZuRSpb0YUK8FnapQAaNhYWJIbBOfDZkGYRmkz_p6QZToCCLNcyYbknvxhQv_8UAVUnH1qqa_TB
 kKI_8CA1ZSnr2G7rQ74iUXSHceLL5hW8BBjsZXyoTAJN.X4_kzZPqBDJn1rTtfLkuV7PRFZtg.Ap
 9UajJM4Fxd94fm1zA.AHE3wqRBuur1PoBYQH6MdYsmnSjKmfaHGVDtQppCjPwefFjWRiDe5OkuLQ
 5QxXoZG8iwCY0Bdl7zb0g6RRnzV2uJY6BNzAK.Cr6LtkT7pcmJHGiy74w0rxH1_Aq7mXaNU5TpcG
 .hD4pZdORdOgZqM8XVVQy15gRFjvK9OIHR5w2k9oDy3TJtYAC6KkgIlxgFrJewo_FJZpR94oKdXK
 jyKKEScMHHcX8i95M6i5.q6HXcQrdQDzPMAHXGUgQt2NTTkh_fjwP0kVisPkW8YoVnP1UuU2kO0O
 00ywWhJE7fRQnxqlZcsbxQ0rxw73J_0Akiaai7IAiHHWBx_aFXvsz1L4KeNHSh.qXfowMGWcCExK
 KZsxCzu6InkEdgudwKCIg1uCL9SuR5wP1XDgIHxW_oRV6RPbv9JoiII8AhhyVdVkRv0_aY4cu7_N
 VjAeIyrNsmu0xWM36kP7hP44cT4Q10sgMOs50jVXFuwc5RxM9S2KKzi2eBO_Cp.EBavhl
X-Sonic-MF: <kevinnnguyen@yahoo.com>
X-Sonic-ID: 0fe1a96a-c695-411a-98d6-d0ab61aacaf9
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.ne1.yahoo.com with HTTP; Thu, 29 Aug 2024 01:19:35 +0000
Date: Thu, 29 Aug 2024 01:19:32 +0000 (UTC)
From: Hai Nguyen <kevinnnguyen@yahoo.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"alsa-user@alsa-project.org" <alsa-user@alsa-project.org>
Message-ID: <1709880450.660675.1724894372069@mail.yahoo.com>
Subject: ALSA question
MIME-Version: 1.0
References: <1709880450.660675.1724894372069.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.22645 YMailNorrin
X-MailFrom: kevinnnguyen@yahoo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LXP2RVTT2DBAIVULRTP6LMI3KTLTS776
X-Message-ID-Hash: LXP2RVTT2DBAIVULRTP6LMI3KTLTS776
X-Mailman-Approved-At: Fri, 30 Aug 2024 07:55:47 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LXP2RVTT2DBAIVULRTP6LMI3KTLTS776/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpIaSwNCg0KwqANCkkgaGF2ZSBhIEMrKyBhdWRpbyBhcHBsaWNhdGlvbiB0aGF0IHBsYXlzIGJh
Y2sgYXVkaW8gZGF0YSBvbiB0aGUgc291bmQgY2FyZCwgRGlnaWdyYW0gVlg4ODJlLsKgaHR0cHM6
Ly93d3cuZGlnaWdyYW0uY29tL3N1cHBvcnQvdng4ODJlLXN1cHBvcnQvDQpUaGUgYXBwbGljYXRp
b24gcnVucyBvbsKgSFBFIFByb0xpYW50IERMMzgwIEdlbjkgU2VydmVyLsKgSFBFIFByb0xpYW50
IERMMzgwIEdlbjkgU2VydmVyDQoNCkl0IGhhcyB3b3JrZWQgd2VsbCB1bmRlciBSSEVMIDcgKGtl
cm5lbCAzLjEwKSBhbmQgUkhFTCA4IChrZXJuZWwgNC54KS4gQXN0aGUgT1MgaXMgdXBncmFkZWQg
dG8gUkhFTCA5IChrZXJuZWwgNS4xNCksIHRoZXJlIGlzIGFuIGJ1ZmZlciB1bmRlcnJ1bi4gV2hl
biBpbnZlc3RpZ2F0aW5nIHRoZSBpc3N1ZSwgSSBydW4g4oCcc3BlYWtlci10ZXN04oCdIHV0aWxp
dHkuIEl0IGZhaWxzIHdpdGggdGhlIGVycm9yIGJlbG93LsKgDQpJJ20ganVzdCB3b25kZXIgaWYg
dGhpcyBoYXMgc29tZXRoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMgaW4gQUxTQSBkcml2ZXIg
ZnJvbSBrZXJuZWwgNC54IHRvIGtlcm5lbCA1LjE0P8KgIElmIG5vdCwgd2hhdCBjb3VsZCBjYXVz
ZSB0aGUgYnVmZmVyIHVuZGVycnVuIGlzc3VlPw0KwqANCllvdXIgYWR2aWNlL2hlbHAgaXMgaGln
aGx5IGFwcHJlY2lhdGVkLA0KVGhhbmtzLA0KwqANCktldmluIE5ndXllbg0KwqANCg0Kc3VkbyBz
cGVha2VyLXRlc3QgLUQgcGx1Z2h3OlZYODgyZTAgLWMgMg0KDQrCoA0KDQpzcGVha2VyLXRlc3Qg
MS4yLjkNCg0KwqANCg0KUGxheWJhY2sgZGV2aWNlIGlzIHBsdWdodzpWWDg4MmUwDQoNClN0cmVh
bSBwYXJhbWV0ZXJzIGFyZSA0ODAwMEh6LCBTMTZfTEUsIDIgY2hhbm5lbHMNCg0KVXNpbmcgMTYg
b2N0YXZlcyBvZiBwaW5rIG5vaXNlDQoNClJhdGUgc2V0IHRvIDQ4MDAwSHogKHJlcXVlc3RlZCA0
ODAwMEh6KQ0KDQpCdWZmZXIgc2l6ZSByYW5nZSBmcm9tIDEyOCB0byA4MTkyDQoNClBlcmlvZCBz
aXplIHJhbmdlIGZyb20gNjQgdG8gNDA5Ng0KDQpVc2luZyBtYXggYnVmZmVyIHNpemUgODE5Mg0K
DQpQZXJpb2RzID0gNA0KDQp3YXMgc2V0IHBlcmlvZF9zaXplID0gMjA0OA0KDQp3YXMgc2V0IGJ1
ZmZlcl9zaXplID0gODE5Mg0KDQowIC0gRnJvbnQgTGVmdA0KDQpXcml0ZSBlcnJvcjogLTUsSW5w
dXQvb3V0cHV0ZXJyb3INCg0KeHJ1bl9yZWNvdmVyeSBmYWlsZWQ6LTUsSW5wdXQvb3V0cHV0IGVy
cm9yDQoNClRyYW5zZmVyIGZhaWxlZDogSW5wdXQvb3V0cHV0ZXJyb3INCg0KwqANCg0KVGhlIERp
Z2lncmFtIGNhcmQgaXMgZGV0ZWN0ZWQgd2l0aCDigJxhcGxheSAtbOKAnSBjb21tYW5kLg0KDQrC
oA0KDQpzdWRvIGFwbGF5IC1sDQoNCioqKiogTGlzdCBvZiBQTEFZQkFDSyBIYXJkd2FyZSBEZXZp
Y2VzICoqKioNCg0KY2FyZCAwOiBWWDg4MmUwIFtEaWdpZ3JhbSBbUENNICMwXV0sIGRldmljZSAw
OiBwY3hociAwW3BjeGhyIDBdDQoNCsKgIFN1YmRldmljZXM6IDQvNA0KDQrCoCBTdWJkZXZpY2Ug
IzA6IHN1YmRldmljZSAjMA0KDQrCoCBTdWJkZXZpY2UgIzE6IHN1YmRldmljZSAjMQ0KDQrCoCBT
dWJkZXZpY2UgIzI6IHN1YmRldmljZSAjMg0KDQrCoCBTdWJkZXZpY2UgIzM6IHN1YmRldmljZSAj
Mw0KDQpjYXJkIDE6IFZYODgyZTEgW0RpZ2lncmFtIFtQQ00gIzFdXSwgZGV2aWNlIDA6IHBjeGhy
IDFbcGN4aHIgMV0NCg0KwqAgU3ViZGV2aWNlczogNC80DQoNCsKgIFN1YmRldmljZSAjMDogc3Vi
ZGV2aWNlICMwDQoNCsKgIFN1YmRldmljZSAjMTogc3ViZGV2aWNlICMxDQoNCsKgIFN1YmRldmlj
ZSAjMjogc3ViZGV2aWNlICMyDQoNCsKgIFN1YmRldmljZSAjMzogc3ViZGV2aWNlICMzDQoNCmNh
cmQgMjogVlg4ODJlMiBbRGlnaWdyYW0gW1BDTSAjMl1dLCBkZXZpY2UgMDogcGN4aHIgMiBbcGN4
aHIyXQ0KDQrCoCBTdWJkZXZpY2VzOiA0LzQNCg0KwqAgU3ViZGV2aWNlICMwOiBzdWJkZXZpY2Ug
IzANCg0KwqAgU3ViZGV2aWNlICMxOiBzdWJkZXZpY2UgIzENCg0KwqAgU3ViZGV2aWNlICMyOiBz
dWJkZXZpY2UgIzINCg0KwqAgU3ViZGV2aWNlICMzOiBzdWJkZXZpY2UgIzMNCg0KY2FyZCAzOiBW
WDg4MmUzIFtEaWdpZ3JhbSBbUENNICMzXV0sIGRldmljZSAwOiBwY3hociAzW3BjeGhyIDNdDQoN
CsKgIFN1YmRldmljZXM6IDQvNA0KDQrCoCBTdWJkZXZpY2UgIzA6IHN1YmRldmljZSAjMA0KDQrC
oCBTdWJkZXZpY2UgIzE6IHN1YmRldmljZSAjMQ0KDQrCoCBTdWJkZXZpY2UgIzI6IHN1YmRldmlj
ZSAjMg0KDQrCoCBTdWJkZXZpY2UgIzM6IHN1YmRldmljZSAjMw0KDQrCoA0KDQo=
