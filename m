Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6CBA4F2A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Sep 2025 21:14:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 494A2601F7;
	Fri, 26 Sep 2025 21:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 494A2601F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758914052;
	bh=AfRMamfXqhGOLxsNoRSFOZPtCosQrz39J3TvI71Vx4Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QFmQlzwvlUbbSM2tcxqj2es5LfDMCQEbMub1GLgd6b42YMr28nY4yUqjS9OnKWDFR
	 VQ1agpMlj7Y1SwSgWSXy0Esp7IzZdiSXEUFP1CNHKuSYqYg2mU7WJudMYS9vx9xqrg
	 OeDJi412tVtHFVbopqXLDO0K+huOANEbHG683jsg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB481F805C1; Fri, 26 Sep 2025 21:13:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C046DF80557;
	Fri, 26 Sep 2025 21:13:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5384EF804FC; Fri, 26 Sep 2025 21:13:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F504F8011B
	for <alsa-devel@alsa-project.org>; Fri, 26 Sep 2025 21:13:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F504F8011B
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1868eaf7857bab00-webhooks-bot@alsa-project.org>
In-Reply-To: <1868eaf785730000-webhooks-bot@alsa-project.org>
References: <1868eaf785730000-webhooks-bot@alsa-project.org>
Subject: Missing UCM matcher for ASUS Zenbook S 14 UX5406SA (cs42l43/cs35l56,
 Lunar Lake)
Date: Fri, 26 Sep 2025 21:13:25 +0200 (CEST)
Message-ID-Hash: J2RTOJ7O4IXTKKWMQ3HW6MN3LC465LFQ
X-Message-ID-Hash: J2RTOJ7O4IXTKKWMQ3HW6MN3LC465LFQ
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2RTOJ7O4IXTKKWMQ3HW6MN3LC465LFQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzYxOSB3YXMgZWRpdGVkIGZyb20gc2pv
bG8zMTI6CgpUaGlzIGlzIG5vdCBhIGtlcm5lbCBidWcgYnV0IGEgbWlzc2luZyBVQ00gbWF0Y2hl
ci4KClJlc3VsdDoKV2l0aCB0aGUgbWF0Y2hlciBiZWxvdyBhbmQgdGhlIGxhdGVzdCB1cHN0cmVh
bSBhbHNhLXVjbS1jb25mIGZpbGVzLCBzcGVha2VycyBhbmQgbWljcm9waG9uZSB3b3JrIG9uIHRo
ZSBBU1VTIFplbmJvb2sgUyAxNCBVWDU0MDZTQSAoTHVuYXIgTGFrZSwgY3M0Mmw0MyArIGNzMzVs
NTYpLgoKVGVzdGVkIG9uOgotIFVidW50dSAyNS4xMCBiZXRhICh1cC10by1kYXRlIGxpdmUgc2Vz
c2lvbikKLSBhbHNhLXVjbS1jb25mOiB1cHN0cmVhbSBtYXN0ZXIgZnJvbSBHaXRIdWIgKGFzIG9m
IDIwMjUtMDktMjYpCgpDYXJkTG9uZ05hbWU6CmBBU1VTVGVLQ09NUFVURVJJTkMuLUFTVVNaZW5i
b29rUzE0VVg1NDA2U0FfVVg1NDA2U0EtMS4wLVVYNTQwNlNBYAoKUm9vdCBjYXVzZToKVXBzdHJl
YW0gbWFzdGVyIGRvZXMgbm90IGNvbnRhaW4gYSBtYXRjaGVyIGZvciB0aGlzIENhcmRMb25nTmFt
ZSwgc28gbm8gVUNNIHByb2ZpbGUgaXMgbG9hZGVkICgtPiDigJxEdW1teSBPdXRwdXTigJ0pLgpB
ZGRpbmcgdGhlIG1hdGNoZXIgYmVsb3cgZW5zdXJlcyB0aGUgZXhpc3Rpbmcgc29mLXNvdW5kd2ly
ZSBwcm9maWxlICh3aGljaCBhbHJlYWR5IGluY2x1ZGVzIGNzNDJsNDMvY3MzNWw1NiByb3V0ZXMp
IGlzIGxvYWRlZCwgYW5kIGF1ZGlvIHdvcmtzLgoKUHJvcG9zZWQgbmV3IGZpbGU6ClBhdGg6IGB1
Y20yL2NvbmYuZC9zb2Ytc291bmR3aXJlL0FTVVMtWmVuYm9vay1TMTQtVVg1NDA2U0EuY29uZmAK
CgoKCmBgYAojIEFTVVMgWmVuYm9vayBTIDE0IFVYNTQwNlNBIChMdW5hciBMYWtlKQpTZWN0aW9u
RGVmYXVsdHMuInNvZi1zb3VuZHdpcmUiIHsKICAgIENvbmRpdGlvbiB7CiAgICAgICAgVHlwZSBS
ZWdleAogICAgICAgIENhcmRMb25nTmFtZSAiQVNVU1RlS0NPTVBVVEVSSU5DLi1BU1VTWmVuYm9v
a1MxNFVYNTQwNlNBLioiCiAgICB9CiAgICBJbmNsdWRlLmNvbmYgInNvZi1zb3VuZHdpcmUvc29m
LXNvdW5kd2lyZS5jb25mIgp9CgpgYGAKCgpWZXJpZmljYXRpb24gKGZpbGVzIGFjdHVhbGx5IGxv
YWRlZCk6CkdhdGhlcmVkIHdpdGg6CmBzdHJhY2UgLWYgLWUgdHJhY2U9JWZpbGUgLW8gL3RtcC91
Y20udHJhY2UgXAogIGFsc2F1Y20gLWMgc29mLXNvdW5kd2lyZSBsaXN0IF92ZXJicyA+L2Rldi9u
dWxsIDI+JjEKZ3JlcCAtb0UgJy91c3Ivc2hhcmUvYWxzYS91Y20yL1teIl0rJyAvdG1wL3VjbS50
cmFjZSB8IHNvcnQgLXUKYAoKUmVzdWx0aW5nIGZpbGVzIGluY2x1ZGVkOgpgCi91c3Ivc2hhcmUv
YWxzYS91Y20yL0ludGVsL3NvZi1oZGEtZHNwL2RzcC5jb25mCi91c3Ivc2hhcmUvYWxzYS91Y20y
L2Jsb2JzL3NvZi9wcm9kdWN0X2NvbmZpZ3MvQVNVU1RlSyBDT01QVVRFUiBJTkMuL0FTVVMgWmVu
Ym9vayBTIDE0IFVYNTQwNlNBX1VYNTQwNlNBLmNvbmYKL3Vzci9zaGFyZS9hbHNhL3VjbTIvYmxv
YnMvc29mL3VzZXJfY29uZmlncy9BU1VTVGVLIENPTVBVVEVSIElOQy4vQVNVUyBaZW5ib29rIFMg
MTQgVVg1NDA2U0FfVVg1NDA2U0EuY29uZgovdXNyL3NoYXJlL2Fsc2EvdWNtMi9jb2RlY3MvY3Mz
NWw1Ni9pbml0LmNvbmYKL3Vzci9zaGFyZS9hbHNhL3VjbTIvY29kZWNzL2NzNDJsNDMvaW5pdC5j
b25mCi91c3Ivc2hhcmUvYWxzYS91Y20yL2NvZGVjcy9oZGEvaGRtaS5jb25mCi91c3Ivc2hhcmUv
YWxzYS91Y20yL2NvbW1vbi9jdGwvbGVkLmNvbmYKL3Vzci9zaGFyZS9hbHNhL3VjbTIvY29tbW9u
L3BjbS9oZG1pLmNvbmYKL3Vzci9zaGFyZS9hbHNhL3VjbTIvY29uZi5kL3NvZi1zb3VuZHdpcmUv
QVNVU1RlS0NPTVBVVEVSSU5DLi1BU1VTWmVuYm9va1MxNFVYNTQwNlNBX1VYNTQwNlNBLTEuMC1V
WDU0MDZTQS5jb25mCi91c3Ivc2hhcmUvYWxzYS91Y20yL2NvbmYuZC9zb2Ytc291bmR3aXJlL3Nv
Zi1zb3VuZHdpcmUuY29uZgovdXNyL3NoYXJlL2Fsc2EvdWNtMi9saWIvY2FyZC1pbml0LmNvbmYK
L3Vzci9zaGFyZS9hbHNhL3VjbTIvbGliL2N0bC1yZW1hcC5jb25mCi91c3Ivc2hhcmUvYWxzYS91
Y20yL2xpYi9nZW5lcmljLmNvbmYKL3Vzci9zaGFyZS9hbHNhL3VjbTIvc29mLXNvdW5kd2lyZS9I
ZG1pLmNvbmYKL3Vzci9zaGFyZS9hbHNhL3VjbTIvc29mLXNvdW5kd2lyZS9IaUZpLmNvbmYKL3Vz
ci9zaGFyZS9hbHNhL3VjbTIvc29mLXNvdW5kd2lyZS9jczM1bDU2LmNvbmYKL3Vzci9zaGFyZS9h
bHNhL3VjbTIvc29mLXNvdW5kd2lyZS9jczQybDQzLmNvbmYKL3Vzci9zaGFyZS9hbHNhL3VjbTIv
c29mLXNvdW5kd2lyZS9kbWljLmNvbmYKL3Vzci9zaGFyZS9hbHNhL3VjbTIvdWNtLmNvbmYKYAoK
ClJlcXVlc3Q6ClBsZWFzZSBhZGQgdGhpcyBtYXRjaGVyIHRvIGFsc2EtdWNtLWNvbmYgdXBzdHJl
YW0sIHNvIHRoYXQgdGhlIEFTVVMgWmVuYm9vayBTIDE0IFVYNTQwNlNBIHdvcmtzIG91dC1vZi10
aGUtYm94IG9uIGFsbCBMaW51eCBkaXN0cmlidXRpb25zLgoKSGFwcHkgdG8gdGVzdCBhbnkgcHJv
cG9zZWQgcGF0Y2ggb3IgcHJvdmlkZSBmdXJ0aGVyIGxvZ3MgaWYgbmVlZGVkLgoKSXNzdWUgVVJM
ICAgICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZi9pc3N1
ZXMvNjE5ClJlcG9zaXRvcnkgVVJMOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fs
c2EtdWNtLWNvbmYK
