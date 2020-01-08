Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C055C133968
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jan 2020 04:09:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 436AB17C9;
	Wed,  8 Jan 2020 04:08:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 436AB17C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578452968;
	bh=JEFoMjcRodBPxqzFOVOzxpnNGcqMgqipSoAidmwWa7Q=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k7j3FpP01Oz5F2vC1BEyZn0CPPYAhwNzdbZvgApvuxza5FdjpekI9yuFyBuB0EnlN
	 attkn9iE5G+CS4+z6aqSkGSwHyMMWhVQux7cXt+pDxSnX1F/cZwo753ID/vrji9DQJ
	 RbiiX54VaORG9z8b/jdcSEjqzfuhN3bkGoQt1Eh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4943EF8010B;
	Wed,  8 Jan 2020 04:07:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A02A3F80159; Wed,  8 Jan 2020 04:07:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=HTML_MESSAGE, MIME_BASE64_TEXT,
 PRX_APP_ATTACH,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from tpecef02.compal.com (exmail3.compal.com [59.120.207.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97BA8F8010B
 for <alsa-devel@alsa-project.org>; Wed,  8 Jan 2020 04:07:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97BA8F8010B
X-UUID: 68e29ac4df144d6cbb5ae1ad152acb7a-20200108
Received: from tpembx01.compal.com [(10.110.15.26)] by tpecef02.compal.com
 (envelope-from <lucien_kao@compal.com>)
 (Cellopoint E-mail Firewall v4.1.6 Build 0408 with TLS)
 with ESMTP id 316997330; Wed, 08 Jan 2020 11:07:20 +0800
Received: from TPEMBX03.compal.com (10.110.15.28) by TPEMBX01.compal.com
 (10.110.15.26) with Microsoft SMTP Server (TLS) id 15.0.995.29; Wed, 8 Jan
 2020 11:07:19 +0800
Received: from TPEMBX03.compal.com (10.110.15.28) by TPEMBX03.compal.com
 (10.110.15.28) with Microsoft SMTP Server (TLS) id 15.0.995.29; Wed, 8 Jan
 2020 11:07:18 +0800
Received: from TPEMBX03.compal.com ([fe80::dd13:fe1c:1008:7f]) by
 TPEMBX03.compal.com ([fe80::dd13:fe1c:1008:7f%16]) with mapi id
 15.00.0995.028; Wed, 8 Jan 2020 11:07:18 +0800
From: <Lucien_Kao@compal.com>
To: <tiwai@suse.de>, <nathan.d.ciobanu@linux.intel.com>
Thread-Topic: [alsa-devel] USB Type-C monitor flashes once when play a video
 file after unplug and re-plug the monitor
Thread-Index: AdXB0nlM5qaLFlJOTlavFS+ZjDjiAwAAOfiAAKNroPAANtEAgAADOdOAACGLiTA=
Date: Wed, 8 Jan 2020 03:07:17 +0000
Message-ID: <bbbfbfa04bd046c78bba621974c9186f@TPEMBX03.compal.com>
References: <d7aba6970fbd48f2b32e2bc6d838ab20@TPEMBX01.compal.com>
 <s5hwoa8j3xi.wl-tiwai@suse.de>
 <5aff22f1e36e484fa52e17c855e8ddc8@TPEMBX03.compal.com>
 <20200107172457.GA18938@nc-hades.jf.intel.com> <s5h7e23p01c.wl-tiwai@suse.de>
In-Reply-To: <s5h7e23p01c.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.110.15.241]
X-TM-SNTS-SMTP: F27CE7B42A6455910C281FDBDB69FE9154D6439A1712855A52C8B77927B30E952000:8
Content-Type: multipart/mixed;
 boundary="_002_bbbfbfa04bd046c78bba621974c9186fTPEMBX03compalcom_"
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: AJ_Cheng@compal.com, alsa-devel@alsa-project.org, CindyXT_Wang@compal.com,
 intel-gfx@lists.freedesktop.org, Nelson_Ye@compal.com, Shane_Yap@compal.com,
 Evan_Tseng@compal.com
Subject: Re: [alsa-devel] USB Type-C monitor flashes once when play a video
 file after unplug and re-plug the monitor
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

--_002_bbbfbfa04bd046c78bba621974c9186fTPEMBX03compalcom_
MIME-Version: 1.0
Content-Type: text/plain

Hi Takashi

Is the attachment what you suspect? That merged to our kernel v4.19 already, hav
e any suggestions? Thanks.

-----Original Message-----
From: Takashi Iwai <tiwai@suse.de>
Sent: Wednesday, January 8, 2020 2:57 AM
To: Nathan Ciobanu <nathan.d.ciobanu@linux.intel.com>
Cc: Kao. Lucien (TPE) <Lucien_Kao@compal.com>; Cheng. AJ (TPE) <AJ_Cheng@compal.
com>; intel-gfx@lists.freedesktop.org; alsa-devel@alsa-project.org; Wang. CindyX
T (TPE) <CindyXT_Wang@compal.com>; Ye. Nelson (TPE) <Nelson_Ye@compal.com>; Yap.
 Shane (TPE) <Shane_Yap@compal.com>; Tseng. Evan (TPE) <Evan_Tseng@compal.com>
Subject: Re: [alsa-devel] USB Type-C monitor flashes once when play a video file
 after unplug and re-plug the monitor

On Tue, 07 Jan 2020 18:24:57 +0100,
Nathan Ciobanu wrote:
>
> On Mon, Jan 06, 2020 at 08:08:04AM +0000, Lucien_Kao@compal.com wrote:
> > Hi Takashi
> >
> > We verified on Ubuntu 19.10 with kernel 5.4.0.0-050400-generic (please refer
 to attachment), the result is positive which symptom doesn't happen anymore onc
e I played music or video sound output through Dell S2718D Type-C monitor. It se
ems had some fix in latest kernel.
>
> Takashi, can you point to the patch series you suspect may have fixed this iss
ue?

The first suspect would be
2756d9143aa517b97961e85412882b8ce31371a6
    ALSA: hda - Fix intermittent CORB/RIRB stall on Intel chips


Takashi

>
> Thanks,
> Nathan
> >
> > Thanks.
> >
> >
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Friday, January 3, 2020 5:16 PM
> > To: Cheng. AJ (TPE) <AJ_Cheng@compal.com>
> > Cc: intel-gfx@lists.freedesktop.org; alsa-devel@alsa-project.org;
> > nathan.d.ciobanu@linux.intel.com; Wang. CindyXT (TPE)
> > <CindyXT_Wang@compal.com>; Ye. Nelson (TPE) <Nelson_Ye@compal.com>;
> > Yap. Shane (TPE) <Shane_Yap@compal.com>; Kao. Lucien (TPE)
> > <Lucien_Kao@compal.com>; Tseng. Evan (TPE) <Evan_Tseng@compal.com>
> > Subject: Re: [alsa-devel] USB Type-C monitor flashes once when play
> > a video file after unplug and re-plug the monitor
> >
> > On Fri, 03 Jan 2020 02:57:03 +0100,
> > <AJ_Cheng@compal.com> wrote:
> > >
> > > Hi Sirs,
> > >         Here is chromebook SW team from Compal.
> > > As the mail title, we hit issue that the external monitor will flash once
when play video after hot pluging.
> > > We can reproduce not only on chromebook but also ubuntu 16.04.
> > > There has higher failure rate with Dell Solomon dock and Dell S2718D monit
or.
> > >
> > > We found adding the delay in "sound/pci/hda/patch_hdmi.c " can fix
> > > this issue.(as the attachment) May need your help to review and advice. Th
anks.
> > >
> > > Here is the issue number in gitlab for more detail.
> > > https://gitlab.freedesktop.org/drm/intel/issues/318
> >
> > Could you check whether it still happens with the latest upstream kernel, at
 least 5.4.y, if it wasn't tested yet?
> >
> > I don't want to put a long delay just because of random reason unless it's r
eally mandatory.  I'm wondering whether the recent write-sync change improves th
e situation, so let's check the recent code.
> >
> >
> > thanks,
> >
> > Takashi
> >
> > >
> > >
> > >
> > > AJ Cheng
> > > NID/NID1
> > > e-mail: AJ_Cheng@compal.com<mailto:AJ_Cheng@compal.com>
> > > Tel:  +886-2-8797-8599 ext. 17561
> > > Mobile : +886-932827829
> > > COMPAL Electronics, Inc.
> > >
> > > [2 flash_once.diff <application/octet-stream (base64)>]
> > >
> > > _______________________________________________
> > > Alsa-devel mailing list
> > > Alsa-devel@alsa-project.org
> > > https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>
>


   =======================================================================
   ========================================
   This message may contain information which is private, privileged or
   confidential of Compal Electronics, Inc.
   If you are not the intended recipient of this message, please notify
   the sender and destroy/delete the message.
   Any review, retransmission, dissemination or other use of, or taking of
   any action in reliance upon this information,
   by persons or entities other than the intended recipient is prohibited.
   =======================================================================
   ========================================

--_002_bbbfbfa04bd046c78bba621974c9186fTPEMBX03compalcom_
Content-Type: application/octet-stream;
	name="0001-UPSTREAM-ALSA-hda-Fix-intermittent-CORB-RIRB-stall-o.patch"
Content-Description: 0001-UPSTREAM-ALSA-hda-Fix-intermittent-CORB-RIRB-stall-o.patch
Content-Disposition: attachment;
	filename="0001-UPSTREAM-ALSA-hda-Fix-intermittent-CORB-RIRB-stall-o.patch";
	size=2623; creation-date="Wed, 08 Jan 2020 02:57:59 GMT";
	modification-date="Wed, 08 Jan 2020 02:57:59 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkYTZlOWE1ZGJiODFmMGNlMDM5YTIwNzlhYTc5MzY2YTU4ODlkNTE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+CkRhdGU6IEZy
aSwgMTkgSnVsIDIwMTkgMTA6Mjc6NTQgKzAyMDAKU3ViamVjdDogW1BBVENIXSBVUFNUUkVBTTog
QUxTQTogaGRhIC0gRml4IGludGVybWl0dGVudCBDT1JCL1JJUkIgc3RhbGwgb24KIEludGVsIGNo
aXBzCgpJdCB0dXJuZWQgb3V0IHRoYXQgdGhlIHJlY2VudCBJbnRlbCBIRC1hdWRpbyBjb250cm9s
bGVyIGNoaXBzIHNob3cgYQpzaWduaWZpY2FudCBzdGFsbCBkdXJpbmcgdGhlIHN5c3RlbSBQTSBy
ZXN1bWUgaW50ZXJtaXR0ZW50bHkuICBJdApkb2Vzbid0IGhhcHBlbiBzbyBvZnRlbiBhbmQgdXN1
YWxseSBpdCBtYXkgcmVhZCBiYWNrIHN1Y2Nlc3NmdWxseQphZnRlciBvbmUgb3IgbW9yZSBzZWNv
bmRzLCBidXQgaW4gc29tZSByYXJlIHdvcnN0IGNhc2VzIHRoZSBkcml2ZXIKd2VudCBpbnRvIGZh
bGxiYWNrIG1vZGUuCgpBZnRlciB0cmlhbC1hbmQtZXJyb3IsIHdlIGZvdW5kIG91dCB0aGF0IHRo
ZSBjb21tdW5pY2F0aW9uIHN0YWxsIHNlZW1zCmNvdmVyZWQgYnkgaXNzdWluZyB0aGUgc3luYyBh
ZnRlciBlYWNoIHZlcmIgd3JpdGUsIGFzIGFscmVhZHkgZG9uZSBmb3IKQU1EIGFuZCBvdGhlciBj
aGlwc2V0cy4gIFNvIHRoaXMgcGF0Y2ggZW5hYmxlcyB0aGUgd3JpdGUtc3luYyBmbGFnIGZvcgp0
aGUgcmVjZW50IEludGVsIGNoaXBzLCBTa3lsYWtlIGFuZCBvbndhcmQsIGFzIGEgd29ya2Fyb3Vu
ZC4KCkFsc28sIHNpbmNlIEJyb3h0b24gYW5kIGNvIGhhdmUgdGhlIHZlcnkgc2FtZSBkcml2ZXIg
ZmxhZ3MgYXMgU2t5bGFrZSwKcmVmZXIgdG8gdGhlIFNreWxha2UgZHJpdmVyIGZsYWdzIGluc3Rl
YWQgb2YgZGVmaW5pbmcgdGhlIHNhbWUKY29udGVudHMgYWdhaW4gZm9yIHNpbXBsaWZpY2F0aW9u
LgoKQnVnTGluazogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0y
MDE5MDEKUmVwb3J0ZWQtYW5kLXRlc3RlZC1ieTogVG9kZCBCcmFuZHQgPHRvZGQuZS5icmFuZHRA
bGludXguaW50ZWwuY29tPgpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ClNpZ25lZC1vZmYt
Ynk6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4KKGNoZXJyeSBwaWNrZWQgZnJvbSBjb21t
aXQgMjc1NmQ5MTQzYWE1MTdiOTc5NjFlODU0MTI4ODJiOGNlMzEzNzFhNgpMaW5rOiBnaXQ6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGl3YWkvc291bmQuZ2l0KQoK
QlVHPWI6MTQwNjEwNTMzClRFU1Q9InJ1biBzdXNwZW5kX3N0cmVzc190ZXN0IGZvciAxMDAwIGN5
Y2xlcyBhbmQgb25seSBzYXcgb25lIGN5Y2xlCiAgICAgIGF1ZGlvIGNvZGVjIHN1c3BlbmQgdGlt
ZSA+IDFzZWMiCgpDaGFuZ2UtSWQ6IEllNTE3M2E4NzNlOTFiY2I0ZmQ5NWQ1YTE0MTFhNGE1ZmRl
ZmI2YTU2ClNpZ25lZC1vZmYtYnk6IEpveWNlIFRvaCA8am95Y2UudG9oQGludGVsLmNvbT4KUmV2
aWV3ZWQtb246IGh0dHBzOi8vY2hyb21pdW0tcmV2aWV3Lmdvb2dsZXNvdXJjZS5jb20vYy9jaHJv
bWl1bW9zL3RoaXJkX3BhcnR5L2tlcm5lbC8rLzE4MjcwNzIKUmV2aWV3ZWQtYnk6IFNhdGh5YW5h
cmF5YW5hIE51amVsbGEgPHNhdGh5YW5hcmF5YW5hLm51amVsbGFAaW50ZWwuY29tPgpSZXZpZXdl
ZC1ieTogTWF0aGV3IEtpbmcgPG1hdGhld2tAY2hyb21pdW0ub3JnPgpSZXZpZXdlZC1ieTogU2Vh
biBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+ClRlc3RlZC1ieTogU2F0aHlhbmFyYXlhbmEg
TnVqZWxsYSA8c2F0aHlhbmFyYXlhbmEubnVqZWxsYUBpbnRlbC5jb20+Ci0tLQogc291bmQvcGNp
L2hkYS9oZGFfaW50ZWwuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwu
YyBiL3NvdW5kL3BjaS9oZGEvaGRhX2ludGVsLmMKaW5kZXggMThkODAxOC4uN2M0MWU2MyAxMDA2
NDQKLS0tIGEvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYworKysgYi9zb3VuZC9wY2kvaGRhL2hk
YV9pbnRlbC5jCkBAIC0zMjgsMTEgKzMyOCwxMCBAQCBlbnVtIHsKIAogI2RlZmluZSBBWlhfRENB
UFNfSU5URUxfU0tZTEFLRSBcCiAJKEFaWF9EQ0FQU19JTlRFTF9QQ0hfQkFTRSB8IEFaWF9EQ0FQ
U19QTV9SVU5USU1FIHxcCisJIEFaWF9EQ0FQU19TWU5DX1dSSVRFIHxcCiAJIEFaWF9EQ0FQU19T
RVBBUkFURV9TVFJFQU1fVEFHIHwgQVpYX0RDQVBTX0k5MTVfQ09NUE9ORU5UKQogCi0jZGVmaW5l
IEFaWF9EQ0FQU19JTlRFTF9CUk9YVE9OIFwKLQkoQVpYX0RDQVBTX0lOVEVMX1BDSF9CQVNFIHwg
QVpYX0RDQVBTX1BNX1JVTlRJTUUgfFwKLQkgQVpYX0RDQVBTX1NFUEFSQVRFX1NUUkVBTV9UQUcg
fCBBWlhfRENBUFNfSTkxNV9DT01QT05FTlQpCisjZGVmaW5lIEFaWF9EQ0FQU19JTlRFTF9CUk9Y
VE9OCQlBWlhfRENBUFNfSU5URUxfU0tZTEFLRQogCiAvKiBxdWlya3MgZm9yIEFUSSBTQiAvIEFN
RCBIdWRzb24gKi8KICNkZWZpbmUgQVpYX0RDQVBTX1BSRVNFVF9BVElfU0IgXAotLSAKMi43LjQK
Cg==

--_002_bbbfbfa04bd046c78bba621974c9186fTPEMBX03compalcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_bbbfbfa04bd046c78bba621974c9186fTPEMBX03compalcom_--

