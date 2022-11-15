Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 135ED629703
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 12:16:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A327D1631;
	Tue, 15 Nov 2022 12:15:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A327D1631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668510996;
	bh=SeAf3EN9O1yYJUSQ7g/m9WDXcnQeVxctgGqVSMEEPOg=;
	h=In-Reply-To:References:From:To:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CNVsA9KtnbfcxI71qo7zqCqCPmzLkt/sToWfqoQoOijS8oy5KLOU92vGFHXDADvxU
	 vfZpikpwiqOKgsuleZRB5L9H/ajqWwIp4INophQRbD2XC5aBD2UYtGGraXQxF13W9w
	 nBJph48yjlRl8Q0k+9eLYQlMYJABORSJ6JRQ9Hnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40CEEF8047C;
	Tue, 15 Nov 2022 12:15:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9151F80171; Tue, 15 Nov 2022 12:15:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,HELO_DYNAMIC_IPADDR,
 HTML_MESSAGE,NO_FM_NAME_IP_HOSTN,RCVD_ILLEGAL_IP,RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com
 [162.62.57.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 385CFF800B8
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 12:15:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 385CFF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="mGxgSj2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1668510928; bh=PWEPr7nhl2pJIFk7B1bzav9+gHI3mTdMzUY9R+FpJjE=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date;
 b=mGxgSj2vwrwVbVs8ZRZ9jSeaZv4Gshw8HEUf3C6WwDAVaerv5OlmqJNeotxRoHD9S
 gJ//k6KEln4bKv52vuhfn8uttrEJPsBpwwlBv6Gutn1fOCSj4w/Z63YESxrV1W+cmK
 cL/RfwI3E9VxcgblorDVpuqQDEvPSr0gp01dnGIQ=
X-QQ-FEAT: oHWrrGTW1dC93WHAYZD9jnWc/36R7j5q
X-QQ-SSF: 00000000000000F0000000000000
X-QQ-XMAILINFO: OYRFB0RV71Lzn8pBi7BlIdg46OqFqZRgLK/5gfQliX0uVjfIGPCzvMkHBy1shY
 BiD4N5vbJAg6wH79kAF6n0ja1GmNP7tpMUAXUC0QJ0n+RGEv+xsZ7S1s88V6rwDBhxnA84Rl1BMWO
 rIKMXMbhxyfOBXbs7rqW5NwknEiG9h8SupznRlYvfdojpYCh1mWzA7QcCGXUEqj2s/apvsBm5TdxG
 YW4olEZg/EKWBMbBW7BBBb5QXwSJsRMkhdJMzfvldObmatY91a5p9oWvvimSl/sHziteAj0AhQzq9
 WTfwpONc+eULRDttDeJfbncgoXaDbeiS7qmJ9HliVJIPhflYf2OoyvekbTVwLIZzFCg9W8KPVEre7
 v2LXL7Qn32CfCR7fxq/N36j3bADW2nhjEJOIvDEznmgHoCK+prE2TO2yHRJHgvAp7Smbo8wr8x871
 w/ahenzQWP0y9m8f800vdIunjysSVHm/xX0XIRjTtH5pmqkCwT0b3yG6vu0kqTg3jbgvNY9Ejjxl+
 2QnU5tQ8Rdzc2+loKntpZc+8U7UH12jMz4F4b8XVbNW3tBKzxp/BiipNYM5ykgKt7PHaOv5qea71s
 vt9umbu1jSl8XQYMhzk2DxVcoNGaXZqce6jhFI7bfZ0MsK4AbLb5Wzv6ZFBINGSKED1NUuquRy5DE
 Rp+YGHhsDLRIq53peSoRhL0eqFrUjdriVtJoogxFMYeI2wH9Uw+qm2dbYXWngft5pKCFN2GXu2Pa0
 xtC4g4HSzYr5WFNbdy73luaWecsZimV+zgUJBWNLvzd4kgczmDN7ENu+AE7n7moTMW6pvnBpFRhhr
 HYlEVG1i0boOiSEzi2UXydHfxT8q4htVwzAIaB1RjBSfS9zjSyAmxbCeIIBcemNuPJNKJiISs1Vca
 tjv0X2c22nxJlKRdZgMiEorXFrDFLAXL5qdCuxFZYO6UkdPGmiT3viJBWuXdX96ECM/pHWyFQtgVL
 pqh31wbQ==
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 255.25.247.146
In-Reply-To: <8039aad2-3d6f-153f-bf23-892c3804b0fa@linux.intel.com>
References: <tencent_59850BB028662B6F2D49D7F3624AB84CCF05@qq.com>
 <8039aad2-3d6f-153f-bf23-892c3804b0fa@linux.intel.com>
X-QQ-STYLE: 
X-QQ-mid: webmail338t1668510928t8690528
From: "=?gb18030?B?bGlzaHFjaG4=?=" <lishqchn@qq.com>
To: "=?gb18030?B?QW1hZGV1c3ogU4EwkjBhd2movXNraQ==?="
 <amadeuszx.slawinski@linux.intel.com>,
 "=?gb18030?B?cGVyZXg=?=" <perex@perex.cz>,
 "=?gb18030?B?dGl3YWk=?=" <tiwai@suse.com>
Subject: =?gb18030?B?u9i4tKO6IFtQQVRDSF0gQXNvYzogY29yZTogZml4?=
 =?gb18030?B?IHdyb25nIHNpemUga3phbGxvYyBmb3IgcnRkJ3Mg?=
 =?gb18030?B?Y29tcG9uZW50cyBtZW1iZXI=?=
Mime-Version: 1.0
Date: Tue, 15 Nov 2022 19:15:27 +0800
X-Priority: 3
Message-ID: <tencent_88921E02D76051F3D6D31A8A2ED745B7B006@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: =?gb18030?B?YWxzYS1kZXZlbA==?= <alsa-devel@alsa-project.org>,
 =?gb18030?B?YnJvb25pZQ==?= <broonie@kernel.org>,
 =?gb18030?B?bGdpcmR3b29k?= <lgirdwood@gmail.com>,
 =?gb18030?B?bGludXgta2VybmVs?= <linux-kernel@vger.kernel.org>
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

cnRkJ3MgZmxleGlibGUgYXJyYXlzIGFyZSB0eXBlb2Ygc3RydWN0IHNuZF9zb2NfY29tcG9u
ZW50ICpjb21wb25lbnRzW10mbmJzcDsgd2hpY2ggbWVhbnMgc3RydWN0X3BvaW50ZXIgZmxl
eGlibGUgYXJyYXlzDQpzaXplb2YoY29tcG9uZW50KSB3aWxsIGFsbG9jYXRlIHNpemVvZihz
dHJ1Y3Qgc25kX3NvY19jb21wb25lbnQpLCBidXQgaGVyZSBvbmx5IG5lZWQgc2l6ZW9mKHN0
cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqKSANCg0KDQoNCg0KDQoNCg0KDQotLS0tLS0tLS0t
LS0tLS0tLS0mbmJzcDvUrcq808q8/iZuYnNwOy0tLS0tLS0tLS0tLS0tLS0tLQ0Kt6K8/sjL
OiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJBbWFkZXVzeiBTgTCSMGF3aai9c2tpIiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDxhbWFkZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVsLmNvbSZndDs7
DQq3osvNyrG85DombmJzcDsyMDIyxOoxMdTCMTDI1SjQx8bay8QpIM3tyc83OjAyDQrK1bz+
yMs6Jm5ic3A7Imxpc2hxY2huIjxsaXNocWNobkBxcS5jb20mZ3Q7OyJwZXJleCI8cGVyZXhA
cGVyZXguY3omZ3Q7OyJ0aXdhaSI8dGl3YWlAc3VzZS5jb20mZ3Q7Ow0Ks63LzTombmJzcDsi
YWxzYS1kZXZlbCI8YWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnJmd0OzsiYnJvb25pZSI8
YnJvb25pZUBrZXJuZWwub3JnJmd0OzsibGdpcmR3b29kIjxsZ2lyZHdvb2RAZ21haWwuY29t
Jmd0OzsibGludXgta2VybmVsIjxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnJmd0OzsN
Ctb3zOI6Jm5ic3A7UmU6IFtQQVRDSF0gQXNvYzogY29yZTogZml4IHdyb25nIHNpemUga3ph
bGxvYyBmb3IgcnRkJ3MgY29tcG9uZW50cyBtZW1iZXINCg0KDQoNCk9uIDExLzgvMjAyMiA1
OjI0IEFNLCBsaXNocWNobiB3cm90ZToNCiZndDsgVGhlIGFjdHVhbCBzcGFjZSBmb3Igc3Ry
dWN0IHNuZF9zb2NfY29tcG9uZW50IGhhcyBiZWVuIGFsbG9jYXRlZCBieQ0KJmd0OyBzbmRf
c29jX3JlZ2lzdGVyX2NvbXBvbmVudCwgaGVyZSBydGQncyBjb21wb25lbnRzIGFyZSBwb2lu
dGVycyB0bw0KJmd0OyBjb21wb25lbnRzLCBJIHJlcGxhY2UgdGhlIGJhc2Ugc2l6ZSBmcm9t
ICpjb21wb25lbnQgdG8gY29tcG9uZW50Lg0KJmd0OyANCiZndDsgU2lnbmVkLW9mZi1ieTog
bGlzaHFjaG4gPGxpc2hxY2huQHFxLmNvbSZndDsNCiZndDsgLS0tDQomZ3Q7Jm5ic3A7Jm5i
c3A7IHNvdW5kL3NvYy9zb2MtY29yZS5jIHwgMiArLQ0KJmd0OyZuYnNwOyZuYnNwOyAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCiZndDsgDQomZ3Q7
IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc29jLWNvcmUuYyBiL3NvdW5kL3NvYy9zb2MtY29y
ZS5jDQomZ3Q7IGluZGV4IGE2ZDZkMTBjZDQ3MS4uZDIxZTAyODRiMmFhIDEwMDY0NA0KJmd0
OyAtLS0gYS9zb3VuZC9zb2Mvc29jLWNvcmUuYw0KJmd0OyArKysgYi9zb3VuZC9zb2Mvc29j
LWNvcmUuYw0KJmd0OyBAQCAtNDU5LDcgKzQ1OSw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc25kX3Nv
Y19wY21fcnVudGltZSAqc29jX25ld19wY21fcnVudGltZSgNCiZndDsmbmJzcDsmbmJzcDsg
CSAqLw0KJmd0OyZuYnNwOyZuYnNwOyAJcnRkID0gZGV2bV9remFsbG9jKGRldiwNCiZndDsm
bmJzcDsmbmJzcDsgCQkJJm5ic3A7Jm5ic3A7IHNpemVvZigqcnRkKSArDQomZ3Q7IC0JCQkm
bmJzcDsmbmJzcDsgc2l6ZW9mKCpjb21wb25lbnQpICogKGRhaV9saW5rLSZndDtudW1fY3B1
cyArDQomZ3Q7ICsJCQkmbmJzcDsmbmJzcDsgc2l6ZW9mKGNvbXBvbmVudCkgKiAoZGFpX2xp
bmstJmd0O251bV9jcHVzICsNCiZndDsmbmJzcDsmbmJzcDsgCQkJCQkJIGRhaV9saW5rLSZn
dDtudW1fY29kZWNzICsNCiZndDsmbmJzcDsmbmJzcDsgCQkJCQkJIGRhaV9saW5rLSZndDtu
dW1fcGxhdGZvcm1zKSwNCiZndDsmbmJzcDsmbmJzcDsgCQkJJm5ic3A7Jm5ic3A7IEdGUF9L
RVJORUwpOw0KDQpDYW4ndCBzdHJ1Y3Rfc2l6ZSBtYWNybyBiZSB1c2VkIGluc3RlYWQsIGl0
IGlzIG1lYW50IHRvIGJlIHVzZWQgd2hlbiANCmNhbGN1bGF0aW5nIHNpemUgb2Ygc3RydWN0
cyBjb250YWluaW5nIGZsZXhpYmxlIGFycmF5cyBhdCB0aGUgZW5kPw==
