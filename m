Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CC45428D2
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 10:02:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 440E7178D;
	Wed,  8 Jun 2022 10:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 440E7178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654675358;
	bh=6GF8w8XG8A+j2JJ+L9oU4+FXOzTTitM5rx/sjTwa6Wg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XQVJuBrnwE4Ju2lEyowTQJ72MHYwtfF+zh6heA6NPJAPwDeGff08B2tpz6N/BOjze
	 mVMCddrBzROESoF77WszR1ecoYRIxDNyR2gIRkZGpJ4HtrUloxXfrsmrn9nvLvW/D6
	 RGF4Xwi/K5lblZPy/dnxYM93K2z5ki3xGWBdn5vg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFA9FF800C7;
	Wed,  8 Jun 2022 10:01:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C18FBF800C7; Wed,  8 Jun 2022 10:01:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=FROM_EXCESS_BASE64,
 HTML_MESSAGE,HTML_NONELEMENT_30_40,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDA25F800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 10:01:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDA25F800C7
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: DQ0OCu3gog22upM0lsHtPvjcLzQuB5PLDoRFSueEY/t8v50Uo8lQz65JIdvju
 o7/vQMyFy8m5BhqoXsIsaLGH3wkwdzEH8Z2M8n8ZCqiMvX8CxH6iZ2DhqKYzaiuFhx5wope
 phWsdzCXvndFywO4qln4/lhzz/HMidPGbf1yoYHCasII+V7IhrmrKAYs2ScHzjg8ZNHETtq
 dtzRtLLODoOldyI4SGTtEc/K7ssaIJkFRQ5njIFJp7xN4O3Sb+n0goQmOUWUS/fIFs2xape
 aHADMU9HIO1LsoqPqcISkml785jNSJzW2qKqdjxwxT6g/vX8GiJMLMthpj6aUTn9Z88F4AC
 MwHnsG7yarRT83qQ1U6tDnxDKHN772zCzxByNYRsfbIvSYTnWlUQP2cvHM9uJ9OdZbOu0ru
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 113.57.13.187
X-QQ-STYLE: 
X-QQ-mid: logic634t1654675280t9879720
From: "=?utf-8?B?aHVhbmd3ZW5odWk=?=" <huangwenhuia@uniontech.com>
To: "=?utf-8?B?VGFrYXNoaSBJd2Fp?=" <tiwai@suse.de>,
 "=?utf-8?B?amVyZW15LnN6dQ==?=" <jeremy.szu@canonical.com>
Subject: Re: [PATCH v3] ALSA: hda/realtek - Add HW8326 support
Mime-Version: 1.0
Date: Wed, 8 Jun 2022 16:01:19 +0800
X-Priority: 3
Message-ID: <tencent_07F7916D0C06818D28DB3A0D@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20220608070527.14824-1-huangwenhuia@uniontech.com>
 <87wndrboja.wl-tiwai@suse.de>
 <CAKzWQkySkKccnmSx_2fKT9QvPfwBOV36Mc-pt3KQR0NO1QkQ2w@mail.gmail.com>
 <87leu7bnbh.wl-tiwai@suse.de>
In-Reply-To: <87leu7bnbh.wl-tiwai@suse.de>
X-QQ-ReplyHash: 1655416998
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Wed, 08 Jun 2022 16:01:21 +0800 (CST)
Feedback-ID: logic:uniontech.com:qybgforeign:qybgforeign9
X-QQ-Bgrelay: 1
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: =?utf-8?B?YWxzYS1kZXZlbA==?= <alsa-devel@alsa-project.org>,
 =?utf-8?B?a2FpbGFuZw==?= <kailang@realtek.com>,
 =?utf-8?B?dGFudXJlYWw=?= <tanureal@opensource.cirrus.com>,
 =?utf-8?B?bGludXgta2VybmVs?= <linux-kernel@vger.kernel.org>,
 =?utf-8?B?d3Nl?= <wse@tuxedocomputers.com>,
 =?utf-8?B?dGl3YWk=?= <tiwai@suse.com>,
 =?utf-8?B?aHVpLndhbmc=?= <hui.wang@canonical.com>,
 =?utf-8?B?c2FtaQ==?= <sami@loone.fi>, =?utf-8?B?Y2Ft?= <cam@neo-zeon.de>
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

SSBzZW5kIGEgcGF0Y2ggbm93Lg0KDQoNClRoYW5rcy4NCiZuYnNwOw0KLS0tLS0tLS0tLS0t
LS0tLS0tJm5ic3A7T3JpZ2luYWwmbmJzcDstLS0tLS0tLS0tLS0tLS0tLS0NCkZyb206ICZu
YnNwOyJUYWthc2hpJm5ic3A7SXdhaSI8dGl3YWlAc3VzZS5kZSZndDs7DQpEYXRlOiAmbmJz
cDtXZWQsIEp1biA4LCAyMDIyIDAzOjU2IFBNDQpUbzogJm5ic3A7ImplcmVteS5zenUiPGpl
cmVteS5zenVAY2Fub25pY2FsLmNvbSZndDs7IA0KQ2M6ICZuYnNwOyJodWFuZ3dlbmh1aSI8
aHVhbmd3ZW5odWlhQHVuaW9udGVjaC5jb20mZ3Q7OyAidGl3YWkiPHRpd2FpQHN1c2UuY29t
Jmd0OzsgInBlcmV4IjxwZXJleEBwZXJleC5jeiZndDs7ICJhbHNhLWRldmVsIjxhbHNhLWRl
dmVsQGFsc2EtcHJvamVjdC5vcmcmZ3Q7OyAia2FpbGFuZyI8a2FpbGFuZ0ByZWFsdGVrLmNv
bSZndDs7ICJ0YW51cmVhbCI8dGFudXJlYWxAb3BlbnNvdXJjZS5jaXJydXMuY29tJmd0Ozsg
ImxpbnV4LWtlcm5lbCI8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyZndDs7ICJ3c2Ui
PHdzZUB0dXhlZG9jb21wdXRlcnMuY29tJmd0OzsgImh1aS53YW5nIjxodWkud2FuZ0BjYW5v
bmljYWwuY29tJmd0OzsgInNhbWkiPHNhbWlAbG9vbmUuZmkmZ3Q7OyAiY2FtIjxjYW1AbmVv
LXplb24uZGUmZ3Q7OyANClN1YmplY3Q6ICZuYnNwO1JlOiBbUEFUQ0ggdjNdIEFMU0E6IGhk
YS9yZWFsdGVrIC0gQWRkIEhXODMyNiBzdXBwb3J0DQoNCiZuYnNwOw0KDQpPbiBXZWQsIDA4
IEp1biAyMDIyIDA5OjUzOjMyICswMjAwLA0KSmVyZW15IFN6dSB3cm90ZToNCiZndDsgDQom
Z3Q7IGFuZCBiZXR0ZXIgdG8gZm9sbG93IHRoZSBvcmRlciB0byBlYXN5IHRvIGZpbmQgdGhl
IGNvZGVjIG9uY2UgdGhlIGxpc3QNCiZndDsgZ3Jvd2luZyBuZXh0IHRpbWUsIGUuZy4NCiZn
dDsgDQomZ3Q7IEBAIC02NTEsNiArNjUxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFf
dmVuZG9yX2lkIGhkYV92ZW5kb3JfaWRzW10gPSB7DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHsgMHgxMDk1LCAiU2lsaWNvbiBJbWFn
ZSIgfSwNCiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsgeyAweDEwZGUsICJOdmlkaWEiIH0sDQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHsgMHgxMGVjLCAiUmVhbHRlayIgfSwNCiZn
dDsgKyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB7IDB4MTllNSwgIkh1
YXdlaSIgfSwNCiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgeyAweDExMDIsICJDcmVhdGl2ZSIgfSwNCiZndDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgeyAweDExMDYsICJWSUEiIH0sDQom
Z3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHsg
MHgxMTFkLCAiSURUIiB9LA0KJmd0OyANCiZndDsgdG8NCiZndDsgDQomZ3Q7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHsgMHgxNGYxLCAiQ29uZXhhbnQi
IH0sDQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IHsgMHgxN2U4LCAiQ2hyb250ZWwiIH0sDQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHsgMHgxODU0LCAiTEciIH0sDQomZ3Q7ICsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgeyAweDE5ZTUsICJIdWF3ZWki
IH0sDQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IHsgMHgxYWVjLCAiV29sZnNvbiBNaWNyb2VsZWN0cm9uaWNzIiB9LA0KJmd0OyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB7IDB4MWFmNCwg
IlFFTVUiIH0sDQomZ3Q7IA0KJmd0OyBhbmQgc28gb24uDQoNCkluZGVlZC4mbmJzcDsgQ2Fy
ZSB0byBzZW5kIGFuIGFkZGl0aW9uYWwgcGF0Y2g/DQoNCg0KdGhhbmtzLA0KDQpUYWthc2hp

