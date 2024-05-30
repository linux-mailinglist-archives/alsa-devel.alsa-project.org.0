Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D10D69077B0
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:01:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F47BEC7;
	Thu, 13 Jun 2024 18:01:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F47BEC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294508;
	bh=ujE4lLrhc46lWkXIGjycTeEqnexyMllEPFhIDUGuBOI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GcHuoSW/M8LZBClWR8jbur7HZKmE4Xk6ymtRXSGSD8BAWPkVGwwk9Cji88Xpz3pat
	 h6sMp2UQHXxGUmt2DjAjUXI/ITe+A7qYFxCOl56zt8l446jydimfUFAQ+l8Su5Rkhr
	 j04CcWji6z180+Eu00KQWOzAmHmliGBmFDvx8LRc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04DB0F8060C; Thu, 13 Jun 2024 18:00:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C865FF805FA;
	Thu, 13 Jun 2024 18:00:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D43BF80149; Thu, 30 May 2024 15:56:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by alsa1.perex.cz (Postfix) with ESMTP id 1857CF800AC
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 15:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1857CF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=Q+bvLoSc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=YlWBScK7Cfqbur+kZZO3WD3aBtFF+cOcNhRe1/BydnY=; b=Q
	+bvLoScajCWYbLRHpoJ1GcASUPRjnqQQLHsfcCH19bWmDEL68+oi4sqt3B7/liTW
	igcGZziBB2x36IRfv+eyCcOh8z/DuwInmGdpMphIMumYzu6pvOJTjsTNM1mzJWLF
	nCrP1T/aYIPgpZAscHl642CeOvUd+UOUL5Z0APAhGs=
Received: from sensor1010$163.com ( [101.86.126.30] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Thu, 30 May 2024 21:56:15 +0800
 (CST)
X-Originating-IP: [101.86.126.30]
Date: Thu, 30 May 2024 21:56:15 +0800 (CST)
From: lizhe  <sensor1010@163.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 skhan@linuxfoundation.org,
	ilpo.jarvinen@linux.intel.com, michael.chan@broadcom.com,
	dave.jiang@intel.com, ville.syrjala@linux.intel.com,
	gustavo.sousa@intel.com, marex@denx.de, uma.shankar@intel.com,
	hamza.mahfooz@amd.com, rostedt@goodmis.org, dan.carpenter@linaro.org,
	rdunlap@infradead.org, arnd@arndb.de, axun.yang@flygoat.com,
	naveen.n.rao@linux.ibm.com, christophe.leroy@csgroup.eu,
	tiwai@suse.de, alsa-devel@alsa-project.org, perex@perex.cz,
	bugreport@ubisectech.com, cmaiolino@redhat.com, jack@suse.cz,
	hughd@google.com, stable@vger.kernel.org, akpm@linux-foundation.org,
	tiagolam@gmail.com, benno.lossin@proton.me, aliceryhl@google.com,
	syoshida@redhat.com, leitao@debian.org, davem@davemloft.net,
	josef@toxicpanda.com, edumazet@google.com, kuba@kernel.org,
	idosch@nvidia.com, paulmck@kernel.org, willemb@google.com,
	matttbe@kernel.org, martineau@kernel.org, grygorii.strashko@ti.com,
	gregory.clement@bootlin.com, grant.likely@secretlab.ca,
	bsegall@google.com, broonie@kernel.org, festevam@gmail.com,
	fancer.lancer@gmail.com, brgl@bgdev.pl, Steen.Hegelund@microchip.com,
	len.brown@intel.com, rafael.j.wysocki@intel.com, d-gole@ti.com,
	qingliang.li@mediatek.com, stanislaw.gruszka@linux.intel.com,
	geert+renesas@glider.be, khilman@deeprootsystems.com,
	broonie@opensource.wolfsonmicro.com, rjw@sisk.pl,
	kai.heng.feng@canonical.com, rui.zhang@intel.com, cai@lca.pw,
	trong@android.com, swboyd@chromium.org, jonathan.haslam@gmail.com,
	jolsa@kernel.org, mhiramat@kernel.org, mingo@kernel.org,
	wangkefeng.wang@huawei.com, willy@infradead.org, khuey@kylehuey.com,
	alexander.shishkin@linux.intel.com, acme@redhat.com,
	jolsa@redhat.com, torvalds@linux-foundation.org,
	peterz@infradead.org, eranian@google.com, vincent.weaver@maine.edu,
	acme@kernel.org, mark.rutland@arm.com, namhyung@kernel.org,
	yabinc@google.com, tglx@linutronix.de, dongli.zhang@oracle.com,
	kstewart@linuxfoundation.org, pombredanne@nexb.com,
	kirill@shutemov.name, kirill.shutemov@linux.intel.com,
	robin.murphy@arm.com, nsaenzjulienne@suse.de, rientjes@google.com,
	hch@lst.de, dyoung@redhat.com, jirislaby@kernel.org,
	sourabhjain@linux.ibm.com, bhe@redhat.com, hbathini@linux.ibm.com,
	mpe@ellerman.id.au, thunder.leizhen@huawei.com, ziy@nvidia.com,
	seanjc@google.com, bp@alien8.de, vkuznets@redhat.com,
	dwmw@amazon.co.uk, mark.rutland@arm.com, mikelley@microsoft.com,
	deller@gmx.de, gpiccoli@igalia.com
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	"Viresh Kumar" <viresh.kumar@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	"Sasha Levin" <sashal@kernel.org>
Subject: Re:[PATCH 6.8 215/493] cpufreq: exit() callback is optional
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240527185637.351762776@linuxfoundation.org>
References: <20240527185626.546110716@linuxfoundation.org>
 <20240527185637.351762776@linuxfoundation.org>
X-CM-CTRLMSGS: pZ50NXRyYWNlS2V5PXByZV8xNmMyNGI2MDdmYjliNGQ4OWJkNGY3N2QwODhlZ
 GNjNg==
X-NTES-SC: 
 AL_Qu2aBfycuEss4yOYZekfm0cagO04WMKxufUi3o9TOph6jCHpwhskf3FtGV7azMaKDQuAmja5bBlqy9VAcph8WLsLKfKstEkGUx1o5ryCttg/2w==
MIME-Version: 1.0
Message-ID: <4a63f4ef.b14a.18fc9c97952.Coremail.sensor1010@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD3P1J_hVhmwItYAA--.8110W
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/1tbiEBruq2XAlMjOXwAFsi
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-MailFrom: sensor1010@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DQPC5UTFUKEDFAQIW35A5R4K5HCLZPOY
X-Message-ID-Hash: DQPC5UTFUKEDFAQIW35A5R4K5HCLZPOY
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:00:31 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQPC5UTFUKEDFAQIW35A5R4K5HCLZPOY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGksIFZpcmVzaCBLdW1hcgogICAgCkRvIHlvdSB0YWtlIHRvIGhlYXJ0IHRoZSBlZmZvcnRzIGFu
ZCBjb250cmlidXRpb25zIG9mIG90aGVycyB0byB0aGUgY29tbXVuaXR5ID8KCgoxLiAKSSBzdWJt
aXR0ZWQgdGhpcyBwYXRjaC4gWW91IGluY2x1ZGVkIGl0IGluIHlvdXIgcGF0Y2ggY29tcGxldGVs
eS4KCiAgICA+ID4gc3RhdGljIGludCBjcHVmcmVxX29mZmxpbmUodW5zaWduZWQgaW50IGNwdSkK
Cj4gPkBAIC0xNzMxLDcgKzE3MzQsNyBAQCBzdGF0aWMgdm9pZCBjcHVmcmVxX3JlbW92ZV9kZXYo
c3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qgc3Vic3lzX2ludGVyZmFjZSAqc2lmKQoKPiA+ICB9
Cgo+ID4gCgo+ID4gIC8qIFdlIGRpZCBsaWdodC13ZWlnaHQgZXhpdCBlYXJsaWVyLCBkbyBmdWxs
IHRlYXIgZG93biBub3cgKi8KCj4gPi0gaWYgKGNwdWZyZXFfZHJpdmVyLT5vZmZsaW5lKQoKPiA+
KyBpZiAoY3B1ZnJlcV9kcml2ZXItPm9mZmxpbmUgJiYgY3B1ZnJlcV9kcml2ZXItPmV4aXQpCgo+
ID4gIGNwdWZyZXFfZHJpdmVyLT5leGl0KHBvbGljeSk7Cgo+ID4gCgo+ID4gIHVwX3dyaXRlKCZw
b2xpY3ktPnJ3c2VtKTsKCj4gPi0tIAoKCgoKMi4gCgpZb3UgaGF2ZSBzZWVuIHRoZSB0aHJlZSBw
YXRjaGVzIEkgc3VibWl0dGVkIHRvIHlvdSBhbmQgdGhlIG1haW4gbGluZSBiZWZvcmUgc3VibWl0
dGluZyB0aGlzIHBhdGNoLgoKCgoKPiA+QEAgLTE2NzAsMTAgKzE2NzAsMTMgQEAgc3RhdGljIHZv
aWQgX19jcHVmcmVxX29mZmxpbmUodW5zaWduZWQgaW50IGNwdSwgc3RydWN0IGNwdWZyZXFfcG9s
aWN5ICpwb2xpY3kpCgo+ID4gICAqLwoKPiA+ICBpZiAoY3B1ZnJlcV9kcml2ZXItPm9mZmxpbmUp
IHsKCj4gPiAgY3B1ZnJlcV9kcml2ZXItPm9mZmxpbmUocG9saWN5KTsKCj4gPi0gfSBlbHNlIGlm
IChjcHVmcmVxX2RyaXZlci0+ZXhpdCkgewoKPiA+LSBjcHVmcmVxX2RyaXZlci0+ZXhpdChwb2xp
Y3kpOwoKPiA+LSBwb2xpY3ktPmZyZXFfdGFibGUgPSBOVUxMOwoKPiA+KyByZXR1cm47Cgo+ID4g
IH0KCj4gPisKCj4gPisgaWYgKGNwdWZyZXFfZHJpdmVyLT5leGl0KQoKPiA+KyBjcHVmcmVxX2Ry
aXZlci0+ZXhpdChwb2xpY3kpOwoKPiA+KwoKPiA+KyBwb2xpY3ktPmZyZXFfdGFibGUgPSBOVUxM
OwoKPiA+IH0KCgoKCkFzIGEgc2VuaW9yIG1lbWJlciBvZiB0aGUga2VybmVsIGNvbW11bml0eSwg
eW91IHNob3VsZCB1cGhvbGQgdGhlIGZhaXJuZXNzIGFuZCBqdXN0aWNlIG9mIHRoZSBjb21tdW5p
dHkuCgoKCgpXaHkgZG8geW91IGhhdmUgdG8gcnVzaCBpbiBhbmQgdGFrZSBvdmVyIG90aGVycycg
cGF0Y2hlcz8gSXNuJ3QgdGhhdCBzZWxmaXNoIG9mIHlvdT8KCgoKCllvdXIgYmVoYXZpb3IgZGlz
cmVzcGVjdHMgb3RoZXJzJyBlZmZvcnRzIGFuZCBlbnRodXNpYXNtLCBhbmQgaXQgdW5kZXJtaW5l
cyB0aGUgY29sbGFib3JhdGl2ZSwgaGFybW9uaW91cywgYW5kIGZhaXIgYXRtb3NwaGVyZSBvZiB0
aGUgY29tbXVuaXR5LgoKCgoKSSBoYXZlIHRyaWVkIHRvIGNvbW11bmljYXRlIHdpdGggeW91IHNl
dmVyYWwgdGltZXMsICBidXQgeW91IGhhdmUgcmVmdXNlZC4gSXMgaXQgYmVjYXVzZSB5b3UgYXJl
IHRoZSBtYWludGFpbmVyIG9mIHRoZSBjb21tdW5pdHkgPyAgV2hlcmUgZG9lcyB5b3VyIGF1dGhv
cml0eSBjb21lIGZyb20gPwoKCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdGhhbmtzLgogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIExpemhlICAgCgoKCgoK
CgoKCgoKCgoKCgoKQXQgMjAyNC0wNS0yOCAwMjo1MzozNywgIkdyZWcgS3JvYWgtSGFydG1hbiIg
PGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPjYuOC1zdGFibGUgcmV2aWV3IHBh
dGNoLiAgSWYgYW55b25lIGhhcyBhbnkgb2JqZWN0aW9ucywgcGxlYXNlIGxldCBtZSBrbm93Lgo+
Cj4tLS0tLS0tLS0tLS0tLS0tLS0KPgo+RnJvbTogVmlyZXNoIEt1bWFyIDx2aXJlc2gua3VtYXJA
bGluYXJvLm9yZz4KPgo+WyBVcHN0cmVhbSBjb21taXQgYjhmODU4MzNjMDU3MzBkNjMxNTc2MDA4
ZGFhYTM0MDk2YmM3ZjNjZSBdCj4KPlRoZSBleGl0KCkgY2FsbGJhY2sgaXMgb3B0aW9uYWwgYW5k
IHNob3VsZG4ndCBiZSBjYWxsZWQgd2l0aG91dCBjaGVja2luZwo+YSB2YWxpZCBwb2ludGVyIGZp
cnN0Lgo+Cj5BbHNvLCB3ZSBtdXN0IGNsZWFyIGZyZXFfdGFibGUgcG9pbnRlciBldmVuIGlmIHRo
ZSBleGl0KCkgY2FsbGJhY2sgaXNuJ3QKPnByZXNlbnQuCj4KPlNpZ25lZC1vZmYtYnk6IFZpcmVz
aCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+Cj5GaXhlczogOTFhMTJlOTFkYzM5ICgi
Y3B1ZnJlcTogQWxsb3cgbGlnaHQtd2VpZ2h0IHRlYXIgZG93biBhbmQgYnJpbmcgdXAgb2YgQ1BV
cyIpCj5GaXhlczogZjMzOWYzNTQxNzAxICgiY3B1ZnJlcTogUmVhcnJhbmdlIGxvY2tpbmcgaW4g
Y3B1ZnJlcV9yZW1vdmVfZGV2KCkiKQo+UmVwb3J0ZWQtYnk6IExpemhlIDxzZW5zb3IxMDEwQDE2
My5jb20+Cj5TaWduZWQtb2ZmLWJ5OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmoud3lzb2Nr
aUBpbnRlbC5jb20+Cj5TaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5v
cmc+Cj4tLS0KPiBkcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jIHwgMTEgKysrKysrKy0tLS0KPiAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj5kaWZmIC0t
Z2l0IGEvZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEuYyBiL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVx
LmMKPmluZGV4IDNjMmM5NTVmYmJiZDYuLjg2ZjFiYzc3NTRlYTYgMTAwNjQ0Cj4tLS0gYS9kcml2
ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jCj4rKysgYi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jCj5A
QCAtMTY3MCwxMCArMTY3MCwxMyBAQCBzdGF0aWMgdm9pZCBfX2NwdWZyZXFfb2ZmbGluZSh1bnNp
Z25lZCBpbnQgY3B1LCBzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeSkKPiAJICovCj4gCWlm
IChjcHVmcmVxX2RyaXZlci0+b2ZmbGluZSkgewo+IAkJY3B1ZnJlcV9kcml2ZXItPm9mZmxpbmUo
cG9saWN5KTsKPi0JfSBlbHNlIGlmIChjcHVmcmVxX2RyaXZlci0+ZXhpdCkgewo+LQkJY3B1ZnJl
cV9kcml2ZXItPmV4aXQocG9saWN5KTsKPi0JCXBvbGljeS0+ZnJlcV90YWJsZSA9IE5VTEw7Cj4r
CQlyZXR1cm47Cj4gCX0KPisKPisJaWYgKGNwdWZyZXFfZHJpdmVyLT5leGl0KQo+KwkJY3B1ZnJl
cV9kcml2ZXItPmV4aXQocG9saWN5KTsKPisKPisJcG9saWN5LT5mcmVxX3RhYmxlID0gTlVMTDsK
PiB9Cj4gCj4gc3RhdGljIGludCBjcHVmcmVxX29mZmxpbmUodW5zaWduZWQgaW50IGNwdSkKPkBA
IC0xNzMxLDcgKzE3MzQsNyBAQCBzdGF0aWMgdm9pZCBjcHVmcmVxX3JlbW92ZV9kZXYoc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3Qgc3Vic3lzX2ludGVyZmFjZSAqc2lmKQo+IAl9Cj4gCj4gCS8q
IFdlIGRpZCBsaWdodC13ZWlnaHQgZXhpdCBlYXJsaWVyLCBkbyBmdWxsIHRlYXIgZG93biBub3cg
Ki8KPi0JaWYgKGNwdWZyZXFfZHJpdmVyLT5vZmZsaW5lKQo+KwlpZiAoY3B1ZnJlcV9kcml2ZXIt
Pm9mZmxpbmUgJiYgY3B1ZnJlcV9kcml2ZXItPmV4aXQpCj4gCQljcHVmcmVxX2RyaXZlci0+ZXhp
dChwb2xpY3kpOwo+IAo+IAl1cF93cml0ZSgmcG9saWN5LT5yd3NlbSk7Cj4tLSAKPjIuNDMuMAo+
Cj4K
