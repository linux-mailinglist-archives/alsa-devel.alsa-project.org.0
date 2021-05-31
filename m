Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0110C396DB8
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 09:04:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B82416BF;
	Tue,  1 Jun 2021 09:03:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B82416BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622531045;
	bh=MOr9sLdwSXcKdNXLusHdcnwJ0kaMTPQxapkvhTnINhw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LZz563kGHa/cBb6fDssPZwO/WMLPwtcTkOTPx6DImDKHUYG2HFu2hy6LaRpCDMWCh
	 qbc4FZG0PQZy3gogBZCE85mtxhR+PEzvh0ksJjmYlOPFfqQjOXAk8eb1iBfXi1shg3
	 3U1WcrNkrkBovSMrSY+RK1yRNeWoRPfPmkzcX5ik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3428BF801DB;
	Tue,  1 Jun 2021 09:01:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C1CCF80253; Mon, 31 May 2021 08:35:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=NICE_REPLY_A,PRX_BODY_78,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46CA1F80096
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 08:35:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46CA1F80096
IronPort-SDR: JFiayaR7FCAm6naH461y52GPxcGRfvoE2O+U1cGFz+ITqTP8rcGg14lv30f0HlEuPJzLMTkrJt
 rWM4ODxmUKVQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10000"; a="224572947"
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; d="scan'208";a="224572947"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2021 23:35:17 -0700
IronPort-SDR: HXRN+ZVIcy6qIp4CV/+r4KnpMsRB70XJeCW5vCp7rZqj/vKXxDd/G6ZCL72Ti6MoDqJqmqd0H4
 SXswghMbpCJQ==
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; d="scan'208";a="478792034"
Received: from baumgarp-mobl.ger.corp.intel.com (HELO [10.249.40.142])
 ([10.249.40.142])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2021 23:35:13 -0700
Subject: Re: [PATCH] ASoC: SOF: Intel: pci-tgl: add ADL-M support
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20210528184153.18251-1-kai.vehmanen@linux.intel.com>
From: "Ujfalusi, Peter" <peter.ujfalusi@intel.com>
Message-ID: <8527229c-f3a8-6480-9ff9-e0cec6bd5524@intel.com>
Date: Mon, 31 May 2021 09:35:15 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210528184153.18251-1-kai.vehmanen@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Tue, 01 Jun 2021 09:01:32 +0200
Cc: daniel.baluta@nxp.com, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
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

SGkgS2FpLAoKT24gNS8yOC8yMDIxIDk6NDEgUE0sIEthaSBWZWhtYW5lbiB3cm90ZToKPiBBZGQg
UENJIERJRCBmb3IgSW50ZWwgQWxkZXJMYWtlLU0uCj4gCj4gU2lnbmVkLW9mZi1ieTogS2FpIFZl
aG1hbmVuIDxrYWkudmVobWFuZW5AbGludXguaW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBQw6l0
ZXIgVWpmYWx1c2kgPHBldGVyLnVqZmFsdXNpQGludGVsLmNvbT4KCnBldGVyLnVqZmFsdXNpQGxp
bnV4LmludGVsLmNvbSB3b3VsZCBiZSBiZXR0ZXIuCgo+IFJldmlld2VkLWJ5OiBSYW5qYW5pIFNy
aWRoYXJhbiA8cmFuamFuaS5zcmlkaGFyYW5AbGludXguaW50ZWwuY29tPgo+IFJldmlld2VkLWJ5
OiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwu
Y29tPgo+IC0tLQo+ICBzb3VuZC9zb2Mvc29mL2ludGVsL3BjaS10Z2wuYyB8IDIgKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mv
c29mL2ludGVsL3BjaS10Z2wuYyBiL3NvdW5kL3NvYy9zb2YvaW50ZWwvcGNpLXRnbC5jCj4gaW5k
ZXggODhjM2JmNDA0ZGQ3Li5hMDAyNjIxODRlZmEgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29jL3Nv
Zi9pbnRlbC9wY2ktdGdsLmMKPiArKysgYi9zb3VuZC9zb2Mvc29mL2ludGVsL3BjaS10Z2wuYwo+
IEBAIC0xMTYsNiArMTE2LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHNv
Zl9wY2lfaWRzW10gPSB7Cj4gIAkJLmRyaXZlcl9kYXRhID0gKHVuc2lnbmVkIGxvbmcpJmFkbHNf
ZGVzY30sCj4gIAl7IFBDSV9ERVZJQ0UoMHg4MDg2LCAweDUxYzgpLCAvKiBBREwtUCAqLwo+ICAJ
CS5kcml2ZXJfZGF0YSA9ICh1bnNpZ25lZCBsb25nKSZhZGxfZGVzY30sCj4gKwl7IFBDSV9ERVZJ
Q0UoMHg4MDg2LCAweDUxY2MpLCAvKiBBREwtTSAqLwo+ICsJCS5kcml2ZXJfZGF0YSA9ICh1bnNp
Z25lZCBsb25nKSZhZGxfZGVzY30sCj4gIAl7IDAsIH0KPiAgfTsKPiAgTU9EVUxFX0RFVklDRV9U
QUJMRShwY2ksIHNvZl9wY2lfaWRzKTsKPiAKPiBiYXNlLWNvbW1pdDogMDU4ZWZiNDA2NDE4NDU0
MzJjNTI3Nzc0NDNiMzM3MmRiYzk3YzAzMgo+IAoKLS0gClDDqXRlcgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW50
ZWwgRmlubGFuZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBMIDI4MSwgMDAxODEgSGVsc2lua2kg
CkJ1c2luZXNzIElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0IApEb21pY2lsZWQgaW4gSGVsc2lu
a2kgCgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVu
dGlhbCBtYXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQo
cykuIEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVycyBpcyBzdHJpY3RseSBwcm9o
aWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVjaXBpZW50LCBwbGVhc2UgY29u
dGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllcy4K

