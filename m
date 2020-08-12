Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE5124253F
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 08:20:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB19A166B;
	Wed, 12 Aug 2020 08:19:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB19A166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597213223;
	bh=d5x1JuCGVtNjGsTQJ2MNNYaliL0SY5XdXnbFaLAzIoM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KRrJ2WU2gC08JBE8wPtprBX8r8HXBMt7LcucOgfq3D2kDBZpn3Ejnno1RmOkgqHeH
	 u6cXTZuo3YAZWJNsyUWF/lI6qglUNXwYqi3rAHVROvejJub65hGU3ZupKbNXYhOSnY
	 8usEmdo8i59kPJOHVhGVsn69EzwZvo/bJKGoO/XE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AD0DF801DB;
	Wed, 12 Aug 2020 08:18:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ADADF8022B; Wed, 12 Aug 2020 08:18:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_APP_ATTACH,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72D38F800D3;
 Wed, 12 Aug 2020 08:18:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72D38F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="WkNF6txz"
Received: from si0vm1948.rbesz01.com
 (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
 by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 4BRKJj1QKwz1XLFjg;
 Wed, 12 Aug 2020 08:18:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=key1-intmail; t=1597213109;
 bh=aZg6wRaR1xwdq6b0++Dj6+nhjbBmKZPzEVfbTnXeT5U=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=WkNF6txzAXYPLIm0oqvDbY6i9zm/WuPQU7YS04fjFOvwGwVle3sUiXhSm8OrDrrjy
 BjHkz7dDZ5h0wOxq/U0JoGl8OYRuHoYoCzg7BoBaVmgyg2HeGM6Dt11nlI+v6eHUON
 cwA3h00I9qsk6EJE9GRS6t4eehK/iNBmSWU7lrkc=
Received: from si0vm4642.rbesz01.com (unknown [10.58.172.176])
 by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 4BRKJj0s9kz5P1;
 Wed, 12 Aug 2020 08:18:29 +0200 (CEST)
X-AuditID: 0a3aad12-24bff700000028b1-ec-5f3389b5cb4e
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by si0vm4642.rbesz01.com (SMG Outbound) with SMTP id 7F.61.10417.5B9833F5;
 Wed, 12 Aug 2020 08:18:29 +0200 (CEST)
Received: from FE-MBX2042.de.bosch.com (fe-mbx2042.de.bosch.com [10.3.231.52])
 by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 4BRKJj01r3zB1G;
 Wed, 12 Aug 2020 08:18:29 +0200 (CEST)
Received: from SGPMBX2010.APAC.bosch.com (10.187.83.34) by
 FE-MBX2042.de.bosch.com (10.3.231.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1979.3; Wed, 12 Aug 2020 08:18:28 +0200
Received: from SGPMBX2012.APAC.bosch.com (10.187.83.41) by
 SGPMBX2010.APAC.bosch.com (10.187.83.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1979.3; Wed, 12 Aug 2020 14:18:25 +0800
Received: from SGPMBX2012.APAC.bosch.com ([fe80::9cea:9250:3b02:f173]) by
 SGPMBX2012.APAC.bosch.com ([fe80::9cea:9250:3b02:f173%4]) with mapi id
 15.01.1979.003; Wed, 12 Aug 2020 14:18:25 +0800
From: "Vijay Palaniswamy (RBEI/ECF3)" <Vijay.Palaniswamy@in.bosch.com>
To: "tiwai@suse.de" <tiwai@suse.de>, "patch@alsa-project.org"
 <patch@alsa-project.org>
Subject: [PATCH] pcm: dmix: fix access to sum-buffer in non-interleaved mixing
 mode
Thread-Topic: [PATCH] pcm: dmix: fix access to sum-buffer in non-interleaved
 mixing mode
Thread-Index: AdZwafrbX9qPlELCQHuHEmOhdV8LxA==
Date: Wed, 12 Aug 2020 06:18:25 +0000
Message-ID: <23d65e0d76d047a3aa833eb699e7d7c8@in.bosch.com>
Accept-Language: en-US, en-SG
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.207]
Content-Type: multipart/mixed;
 boundary="_004_23d65e0d76d047a3aa833eb699e7d7c8inboschcom_"
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsXCZbVWVndrp3G8wcoeFosrFw8xWaxd3sBq
 8XLzGyYHZo8Nn5vYPDafrg5giuKySUnNySxLLdK3S+DKWPZ2MXtBdz9jRfuWtewNjCeaGbsY
 OTkkBEwkjjcsY+9i5OIQEpjBJLFp/hFGCGc3o8TyxatYIZwPjBKbL6xng3A+M0rc/38PKnOE
 UWJhzw9mkGFsAm4SL45/ZAOxRQQiJF42zmABKWIWeM8osXTfbCaQhLBAqETfpnVQRVESM7/e
 YIew9STerD4DVsMioCoxrW8nWA2vgLXEqyVHwWoYBWQlFt2cxAJiMwuIS9x6Mp8J4gsRiYcX
 T7NB2KISLx//Y4WwFSWuvVoOdBwHUH2MxPrLkRAjBSVOznzCMoFRdBaSSbMQqmYhqYIoSZJY
 dX4SG4StI7Fg9ycoW1ti2cLXzDD2mQOPmTDFCyTO93SyQ4wPkZg+z3gWOFDuMUp0LjvPDlGj
 KDGl+yH7AkaeVYyixZkGZbkmZiZGekVJqcVVBoZ6yfm5mxghkS+0g/FXxwe9Q4xMHIyHGFWA
 Wh9tWH2BUYolLz8vVUmE1+6ufrwQb0piZVVqUX58UWlOavEhRmkOFiVxXhWejXFCAumJJanZ
 qakFqUUwWSYOTqkGJpUYuS1fUrTN5q4vCo/n8ql9VHbZ+oH/5M2Tur3sf1xd4ax2lelK57Jn
 3nOuf57860XwFOG30917KxaaZDTcOff+eW7uhrrFkw1YmytljE6fPH/X7+GmGXVzzuQoT0p9
 8fOU+TZlyfNKnaaSLu66D7iSd8z0ulOVF8v/bLNCZv3VDBV3ZqcktgV7LFWbHpbOPalywCvM
 2DyRrdv9inzB/xq56NU3biQt3dUucarZ6nDLvAA+HeerznIPWmr5BQqkzBY+cPPbvde3Zcn9
 RqEzreeqqxdqqT8MDmdqPaTWo+fPLL62SCmFQeot+8xLnLtPb3iz79wzgct+83uY1iz0EljG
 +E6Pt/bBsi0cLCwvlViKMxINtZiLihMBZTjl3XcDAAA=
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "Devi Laxmi \(RBEI/ECF3\)" <Laxmi.Devi@in.bosch.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Pape Andreas
 \(ADITG/ESS1\)" <APape@de.adit-jv.com>,
 "Channaiah Vanitha \(RBEI/ECF3\)" <Vanitha.Channaiah@in.bosch.com>
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

--_004_23d65e0d76d047a3aa833eb699e7d7c8inboschcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

When dmix uses non-interleaved mixing mode the offset and step width to sum=
_buffer was calculated by using the dmix channels instead of the slave chan=
nels. This leads to audio distortions due to frame corruption.
Issue happens while doing channel wise mixing of src and destination buffer=
s.

Attached the patch to fix the offset and step width calculation based on sl=
ave channels for sum buffer. So mixed data will be saved in respective chan=
nels of sum buffer.

Steps to reproduce the issue:
With below configuratio, Do aplay on both device in parallel for audio dist=
ortion

pcm.dmix_2_channels {
        type dmix
        ipc_key 5678293
        ipc_perm 0660
        ipc_gid audio
        bindings [0 1]

        slave {
                pcm "hardware"
                channels 2
                periods  4
                period_time 40000
        }
}

pcm.dmix_1_channels {
        type dmix
        ipc_key 5678293
        ipc_perm 0660
        ipc_gid audio
        bindings [0]

        slave {
                pcm "hardware"
                channels 1
                periods  4
                period_time 40000
        }
}

pcm.hardware {
        type hw
        card 0
        channels 2
        rate 48000
        format S16_LE
}

Best regards

Palaniswamy Vijay

--_004_23d65e0d76d047a3aa833eb699e7d7c8inboschcom_
Content-Type: application/octet-stream;
	name="0001-pcm-dmix-fix-access-to-sum-buffer-in-non-interleaved.patch"
Content-Description: 0001-pcm-dmix-fix-access-to-sum-buffer-in-non-interleaved.patch
Content-Disposition: attachment;
	filename="0001-pcm-dmix-fix-access-to-sum-buffer-in-non-interleaved.patch";
	size=2684; creation-date="Tue, 11 Aug 2020 14:30:15 GMT";
	modification-date="Tue, 11 Aug 2020 14:20:49 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmYTYzODRmNTg2ZTQ0Mjg2NGYyMmFkNGYzMGIzMmQ4OWIzOThkOTM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaWpheSBQYWxhbmlzd2FteSA8dmlqYXkucGFsYW5pc3dhbXlA
aW4uYm9zY2guY29tPgpEYXRlOiBUaHUsIDIzIEp1bCAyMDIwIDExOjQ5OjEwICswNTMwClN1Ympl
Y3Q6IFtQQVRDSF0gcGNtOiBkbWl4OiBmaXggYWNjZXNzIHRvIHN1bS1idWZmZXIgaW4gbm9uLWlu
dGVybGVhdmVkIG1peGluZwogbW9kZQoKV2hlbiBkbWl4IHVzZXMgbm9uLWludGVybGVhdmVkIG1p
eGluZyBtb2RlIHRoZSBvZmZzZXQgYW5kIHN0ZXAgd2lkdGgKdG8gc3VtX2J1ZmZlciB3YXMgY2Fs
Y3VsYXRlZCBieSB1c2luZyB0aGUgZG1peCBjaGFubmVscyBpbnN0ZWFkIG9mCnRoZSBzbGF2ZSBj
aGFubmVscy4gVGhpcyBsZWFkcyB0byBhdWRpbyBkaXN0b3J0aW9ucyBkdWUgdG8gZnJhbWUKY29y
cnVwdGlvbi4KCmV4YW1wbGU6Ci0gV2l0aCBiZWxvdyBjb25maWd1cmF0aW8sIERvIGFwbGF5IG9u
IGJvdGggZGV2aWNlIGluIHBhcmFsbGVsIGZvcgphdWRpbyBkaXN0b3J0aW9uCgpwY20uZG1peF8y
X2NoYW5uZWxzIHsKICAgICAgICB0eXBlIGRtaXgKICAgICAgICBpcGNfa2V5IDU2NzgyOTMKICAg
ICAgICBpcGNfcGVybSAwNjYwCiAgICAgICAgaXBjX2dpZCBhdWRpbwogICAgICAgIGJpbmRpbmdz
IFswIDFdCgogICAgICAgIHNsYXZlIHsKICAgICAgICAgICAgICAgIHBjbSAiaGFyZHdhcmUiCiAg
ICAgICAgICAgICAgICBjaGFubmVscyAyCiAgICAgICAgICAgICAgICBwZXJpb2RzICA0CiAgICAg
ICAgICAgICAgICBwZXJpb2RfdGltZSA0MDAwMAogICAgICAgIH0KfQoKcGNtLmRtaXhfMV9jaGFu
bmVscyB7CiAgICAgICAgdHlwZSBkbWl4CiAgICAgICAgaXBjX2tleSA1Njc4MjkzCiAgICAgICAg
aXBjX3Blcm0gMDY2MAogICAgICAgIGlwY19naWQgYXVkaW8KICAgICAgICBiaW5kaW5ncyBbMF0K
CiAgICAgICAgc2xhdmUgewogICAgICAgICAgICAgICAgcGNtICJoYXJkd2FyZSIKICAgICAgICAg
ICAgICAgIGNoYW5uZWxzIDEKICAgICAgICAgICAgICAgIHBlcmlvZHMgIDQKICAgICAgICAgICAg
ICAgIHBlcmlvZF90aW1lIDQwMDAwCiAgICAgICAgfQp9CgpwY20uaGFyZHdhcmUgewogICAgICAg
IHR5cGUgaHcKICAgICAgICBjYXJkIDAKICAgICAgICBjaGFubmVscyAyCiAgICAgICAgcmF0ZSA0
ODAwMAogICAgICAgIGZvcm1hdCBTMTZfTEUKfQoKU2lnbmVkLW9mZi1ieTogVmlqYXkgUGFsYW5p
c3dhbXkgPHZpamF5LnBhbGFuaXN3YW15QGluLmJvc2NoLmNvbT4KLS0tCiBzcmMvcGNtL3BjbV9k
bWl4LmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NyYy9wY20vcGNtX2RtaXguYyBiL3NyYy9wY20vcGNt
X2RtaXguYwppbmRleCBlOTM0M2IxLi44YmNlN2FjIDEwMDY0NAotLS0gYS9zcmMvcGNtL3BjbV9k
bWl4LmMKKysrIGIvc3JjL3BjbS9wY21fZG1peC5jCkBAIC0yMTIsMTAgKzIxMiwxMCBAQCBzdGF0
aWMgdm9pZCBtaXhfYXJlYXMoc25kX3BjbV9kaXJlY3RfdCAqZG1peCwKIAkJZG9fbWl4X2FyZWFz
KHNpemUsCiAJCQkgICAgICgodW5zaWduZWQgY2hhciAqKWRzdF9hcmVhc1tkY2huXS5hZGRyICsg
ZHN0X2FyZWFzW2RjaG5dLmZpcnN0IC8gOCkgKyBkc3Rfb2ZzICogZHN0X3N0ZXAsCiAJCQkgICAg
ICgodW5zaWduZWQgY2hhciAqKXNyY19hcmVhc1tjaG5dLmFkZHIgKyBzcmNfYXJlYXNbY2huXS5m
aXJzdCAvIDgpICsgc3JjX29mcyAqIHNyY19zdGVwLAotCQkJICAgICBkbWl4LT51LmRtaXguc3Vt
X2J1ZmZlciArIGNoYW5uZWxzICogZHN0X29mcyArIGNobiwKKwkJCSAgICAgZG1peC0+dS5kbWl4
LnN1bV9idWZmZXIgKyBkbWl4LT5zaG1wdHItPnMuY2hhbm5lbHMgKiBkc3Rfb2ZzICsgZGNobiwK
IAkJCSAgICAgZHN0X3N0ZXAsCiAJCQkgICAgIHNyY19zdGVwLAotCQkJICAgICBjaGFubmVscyAq
IHNpemVvZihzaWduZWQgaW50KSk7CisJCQkgICAgIGRtaXgtPnNobXB0ci0+cy5jaGFubmVscyAq
IHNpemVvZihzaWduZWQgaW50KSk7CiAJfQogfQogCkBAIC0yODAsMTAgKzI4MCwxMCBAQCBzdGF0
aWMgdm9pZCByZW1peF9hcmVhcyhzbmRfcGNtX2RpcmVjdF90ICpkbWl4LAogCQlkb19yZW1peF9h
cmVhcyhzaXplLAogCQkJICAgICAgICgodW5zaWduZWQgY2hhciAqKWRzdF9hcmVhc1tkY2huXS5h
ZGRyICsgZHN0X2FyZWFzW2RjaG5dLmZpcnN0IC8gOCkgKyBkc3Rfb2ZzICogZHN0X3N0ZXAsCiAJ
CQkgICAgICAgKCh1bnNpZ25lZCBjaGFyICopc3JjX2FyZWFzW2Nobl0uYWRkciArIHNyY19hcmVh
c1tjaG5dLmZpcnN0IC8gOCkgKyBzcmNfb2ZzICogc3JjX3N0ZXAsCi0JCQkgICAgICAgZG1peC0+
dS5kbWl4LnN1bV9idWZmZXIgKyBjaGFubmVscyAqIGRzdF9vZnMgKyBjaG4sCisJCQkgICAgICAg
ZG1peC0+dS5kbWl4LnN1bV9idWZmZXIgKyBkbWl4LT5zaG1wdHItPnMuY2hhbm5lbHMgKiBkc3Rf
b2ZzICsgZGNobiwKIAkJCSAgICAgICBkc3Rfc3RlcCwKIAkJCSAgICAgICBzcmNfc3RlcCwKLQkJ
CSAgICAgICBjaGFubmVscyAqIHNpemVvZihzaWduZWQgaW50KSk7CisJCQkgICAgICAgZG1peC0+
c2htcHRyLT5zLmNoYW5uZWxzICogc2l6ZW9mKHNpZ25lZCBpbnQpKTsKIAl9CiB9CiAKLS0gCjIu
Ny40Cgo=

--_004_23d65e0d76d047a3aa833eb699e7d7c8inboschcom_--
